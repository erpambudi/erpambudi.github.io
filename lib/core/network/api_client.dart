import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../config/flavor_config.dart';
import '../constants/api_constants.dart';
import '../error/exceptions.dart';
import 'token_storage.dart';

/// Production-grade API client with centralized error handling,
/// automatic retry, token management, and development logging.
class ApiClient {
  late final Dio dio;
  final TokenStorage tokenStorage;

  /// Callback invoked when a 401 Unauthorized response is received.
  /// Set this to show a session-expired dialog and navigate to login.
  void Function()? onUnauthorized;

  /// Guard flag to prevent showing multiple unauthorized dialogs.
  bool _isHandlingUnauthorized = false;

  /// Maximum number of retry attempts for retryable errors.
  static const int _maxRetries = 2;

  /// Delay between retry attempts.
  static const Duration _retryDelay = Duration(seconds: 1);

  ApiClient({required this.tokenStorage}) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
      ),
    );

    // Order matters: interceptors run in FIFO order for requests,
    // and LIFO order for responses/errors.

    // 1. Auth interceptor — injects Bearer token on every request
    dio.interceptors.add(_authInterceptor());

    // 2. Logging interceptor — only active in development builds
    if (FlavorConfig.isDevelopment || kDebugMode) {
      dio.interceptors.add(_loggingInterceptor());
    }

    // 3. Error interceptor — maps DioException to app-specific exceptions
    //    so datasources don't need try-catch DioException blocks
    dio.interceptors.add(_errorInterceptor());
  }

  // ---------------------------------------------------------------------------
  // Interceptors
  // ---------------------------------------------------------------------------

  /// Injects the stored auth token into every outgoing request.
  InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = tokenStorage.token;
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    );
  }

  /// Logs request/response details in development mode.
  LogInterceptor _loggingInterceptor() {
    return LogInterceptor(
      request: true,
      requestHeader: false,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      logPrint: (object) => debugPrint('🌐 $object'),
    );
  }

  /// Centralizes DioException → app exception mapping.
  ///
  /// After this interceptor, callers will never see raw [DioException].
  /// Instead they'll catch [ServerException], [UnauthorizedException],
  /// [NetworkException], or [ApiTimeoutException].
  InterceptorsWrapper _errorInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException error, ErrorInterceptorHandler handler) async {
        // --- Retry logic for connection-related failures ---
        final isRetryable =
            error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout ||
            error.type == DioExceptionType.connectionError;

        if (isRetryable) {
          final retryCount = error.requestOptions.extra['retryCount'] ?? 0;
          if (retryCount < _maxRetries) {
            await Future.delayed(_retryDelay);
            error.requestOptions.extra['retryCount'] = retryCount + 1;

            try {
              debugPrint(
                '🔄 Retry ${retryCount + 1}/$_maxRetries: '
                '${error.requestOptions.method} ${error.requestOptions.path}',
              );
              final response = await dio.fetch(error.requestOptions);
              return handler.resolve(response);
            } on DioException catch (e) {
              // If retry also fails, let it fall through to error mapping below
              error = e;
            }
          }
        }

        // --- Map DioException to app exceptions ---
        final statusCode = error.response?.statusCode;
        final serverMessage = _extractServerMessage(error);

        // 401 Unauthorized — clear token + notify UI (show dialog)
        if (statusCode == 401) {
          await tokenStorage.deleteToken();

          // Trigger the unauthorized callback (e.g. show dialog)
          // Guard prevents multiple dialogs from concurrent 401 responses
          if (!_isHandlingUnauthorized && onUnauthorized != null) {
            _isHandlingUnauthorized = true;
            onUnauthorized!();
          }

          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: UnauthorizedException(
                message:
                    serverMessage ??
                    'Sesi telah berakhir. Silakan login kembali.',
              ),
              type: error.type,
            ),
          );
          return;
        }

        // Timeout errors
        if (error.type == DioExceptionType.connectionTimeout ||
            error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.sendTimeout) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: ApiTimeoutException(
                message: 'Koneksi timeout. Silakan coba lagi.',
              ),
              type: error.type,
            ),
          );
          return;
        }

        // Connection error (no internet, DNS failure, etc.)
        if (error.type == DioExceptionType.connectionError) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: NetworkException(
                message:
                    'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.',
              ),
              type: error.type,
            ),
          );
          return;
        }

        // Request cancelled
        if (error.type == DioExceptionType.cancel) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              error: RequestCancelledException(),
              type: error.type,
            ),
          );
          return;
        }

        // All other server errors (4xx, 5xx, etc.)
        handler.reject(
          DioException(
            requestOptions: error.requestOptions,
            error: ServerException(
              message: serverMessage ?? 'Terjadi kesalahan pada server.',
              statusCode: statusCode,
            ),
            type: error.type,
            response: error.response,
          ),
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Resets the unauthorized guard flag.
  ///
  /// Call this after the user dismisses the session-expired dialog
  /// so that future 401 responses can trigger the dialog again.
  void resetUnauthorizedGuard() {
    _isHandlingUnauthorized = false;
  }

  /// Attempts to extract a human-readable error message from the server response.
  String? _extractServerMessage(DioException error) {
    try {
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        return data['message'] as String?;
      }
    } catch (_) {}
    return null;
  }
}
