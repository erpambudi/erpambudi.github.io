import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/app_constants.dart';

/// Secure token storage abstraction.
///
/// Uses [FlutterSecureStorage] to store sensitive auth tokens
/// in the platform's secure keychain (iOS Keychain / Android Keystore).
///
/// Also maintains an in-memory cache so that token reads can be
/// performed synchronously after the initial load.
class TokenStorage {
  final FlutterSecureStorage _secureStorage;

  /// In-memory cache of the current token.
  /// Avoids async reads on every API request.
  String? _cachedToken;

  TokenStorage({FlutterSecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  /// Loads the token from secure storage into the in-memory cache.
  ///
  /// Call this once during app initialization before any API calls.
  Future<void> init() async {
    _cachedToken = await _secureStorage.read(key: AppConstants.tokenKey);
  }

  /// Returns the cached token synchronously.
  ///
  /// Returns `null` if no token is stored or [init] hasn't been called.
  String? get token => _cachedToken;

  /// Whether a valid token exists.
  bool get hasToken => _cachedToken != null && _cachedToken!.isNotEmpty;

  /// Saves a token to both secure storage and the in-memory cache.
  Future<void> saveToken(String token) async {
    _cachedToken = token;
    await _secureStorage.write(key: AppConstants.tokenKey, value: token);
  }

  /// Removes the token from both secure storage and the in-memory cache.
  Future<void> deleteToken() async {
    _cachedToken = null;
    await _secureStorage.delete(key: AppConstants.tokenKey);
  }

  /// Clears all data from secure storage and the cache.
  Future<void> clearAll() async {
    _cachedToken = null;
    await _secureStorage.deleteAll();
  }
}
