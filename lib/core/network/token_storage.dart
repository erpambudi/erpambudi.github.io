import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Secure token storage abstraction.
///
/// Uses [FlutterSecureStorage] to store sensitive auth tokens
/// in the platform's secure keychain (iOS Keychain / Android Keystore / Web Crypto).
///
/// Provides a fallback mechanism to [SharedPreferences] in environments where
/// [FlutterSecureStorage] is not supported or fails (e.g. Flutter Web on non-HTTPS / insecure context).
///
/// Also maintains an in-memory cache so that token reads can be
/// performed synchronously after the initial load.
class TokenStorage {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences? _sharedPreferences;

  /// In-memory cache of the current token.
  /// Avoids async reads on every API request.
  String? _cachedToken;

  TokenStorage({
    FlutterSecureStorage? secureStorage,
    SharedPreferences? sharedPreferences,
  }) : _secureStorage = secureStorage ?? const FlutterSecureStorage(),
       _sharedPreferences = sharedPreferences;

  /// Loads the token from secure storage (or fallback) into the in-memory cache.
  ///
  /// Call this once during app initialization before any API calls.
  Future<void> init() async {
    try {
      _cachedToken = await _secureStorage.read(key: AppConstants.tokenKey);
    } catch (e) {
      debugPrint('[TokenStorage] Error reading secure storage: $e');
    }

    // If secure storage returned null (or threw error), check fallback storage
    if (_cachedToken == null || _cachedToken!.isEmpty) {
      _cachedToken = _sharedPreferences?.getString(AppConstants.tokenKey);
    }
  }

  /// Returns the cached token synchronously.
  ///
  /// Returns `null` if no token is stored or [init] hasn't been called.
  String? get token => _cachedToken;

  /// Whether a valid token exists.
  bool get hasToken => _cachedToken != null && _cachedToken!.isNotEmpty;

  /// Saves a token to secure storage. If secure storage fails (e.g. on web non-HTTPS),
  /// it falls back to saving in sharedPreferences.
  Future<void> saveToken(String token) async {
    _cachedToken = token;
    try {
      await _secureStorage.write(key: AppConstants.tokenKey, value: token);
    } catch (e) {
      debugPrint(
        '[TokenStorage] Error writing to secure storage, falling back to SharedPreferences: $e',
      );
      try {
        await _sharedPreferences?.setString(AppConstants.tokenKey, token);
      } catch (fallbackError) {
        debugPrint(
          '[TokenStorage] Error writing to fallback storage: $fallbackError',
        );
      }
    }
  }

  /// Removes the token from secure storage, fallback storage, and the in-memory cache.
  Future<void> deleteToken() async {
    _cachedToken = null;
    try {
      await _secureStorage.delete(key: AppConstants.tokenKey);
    } catch (e) {
      debugPrint('[TokenStorage] Error deleting from secure storage: $e');
    }

    try {
      await _sharedPreferences?.remove(AppConstants.tokenKey);
    } catch (e) {
      debugPrint('[TokenStorage] Error deleting from fallback storage: $e');
    }
  }

  /// Clears all data from secure storage, fallback storage, and the cache.
  Future<void> clearAll() async {
    _cachedToken = null;
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint('[TokenStorage] Error clearing secure storage: $e');
    }

    try {
      await _sharedPreferences?.remove(AppConstants.tokenKey);
    } catch (e) {
      debugPrint('[TokenStorage] Error clearing fallback storage: $e');
    }
  }
}
