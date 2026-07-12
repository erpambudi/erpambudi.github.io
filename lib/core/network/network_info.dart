import 'dart:async';
import 'dart:io';

/// Abstraction for checking network connectivity.
///
/// Use this to proactively check whether the device has internet access
/// before making API calls, providing a better user experience.
abstract class NetworkInfo {
  /// Returns `true` if the device has an active internet connection.
  Future<bool> get isConnected;
}

/// Implementation of [NetworkInfo] using DNS lookup.
///
/// Uses a lightweight DNS lookup to `google.com` to verify connectivity.
/// No additional packages required — uses `dart:io` only.
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup(
        'google.com',
      ).timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    } on TimeoutException catch (_) {
      return false;
    }
  }
}
