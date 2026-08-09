import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';
import '../network/network_info.dart';

/// Helper function to reduce boilerplate try-catch blocks in repositories.
Future<Either<Failure, T>> executeApiCall<T>({
  required NetworkInfo networkInfo,
  required Future<T> Function() call,
  Future<Either<Failure, T>> Function()? onNetworkError,
  Future<Either<Failure, T>> Function(UnauthorizedException)? onUnauthorized,
}) async {
  if (await networkInfo.isConnected) {
    try {
      final result = await call();
      return Right(result);
    } catch (e) {
      // Dio wraps the app exception (UnauthorizedException, ServerException,
      // etc.) inside a DioException and rethrows it. Unwrap it first so the
      // mapping below sees the real exception instead of a generic DioException.
      final error = e is DioException ? e.error : e;

      if (error is UnauthorizedException) {
        if (onUnauthorized != null) {
          return await onUnauthorized(error);
        }
        return Left(UnauthorizedFailure(message: error.message));
      }
      if (error is ServerException) {
        return Left(ServerFailure(message: error.message));
      }
      if (error is NetworkException) {
        if (onNetworkError != null) {
          return await onNetworkError();
        }
        return Left(NetworkFailure(message: error.message));
      }
      if (error is ApiTimeoutException) {
        return Left(TimeoutFailure(message: error.message));
      }
      return Left(ServerFailure(message: 'Terjadi kesalahan: $error'));
    }
  } else {
    if (onNetworkError != null) {
      return await onNetworkError();
    }
    return const Left(NetworkFailure());
  }
}
