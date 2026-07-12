class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException({required this.message, this.statusCode});

  @override
  String toString() => 'ServerException: $message (status: $statusCode)';
}

class CacheException implements Exception {
  final String message;

  CacheException({required this.message});

  @override
  String toString() => 'CacheException: $message';
}

class NetworkException implements Exception {
  final String message;

  NetworkException({this.message = 'Tidak ada koneksi internet'});

  @override
  String toString() => 'NetworkException: $message';
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException({
    this.message = 'Sesi telah berakhir. Silakan login kembali.',
  });

  @override
  String toString() => 'UnauthorizedException: $message';
}

class ApiTimeoutException implements Exception {
  final String message;

  ApiTimeoutException({this.message = 'Koneksi timeout. Silakan coba lagi.'});

  @override
  String toString() => 'ApiTimeoutException: $message';
}

class RequestCancelledException implements Exception {
  final String message;

  RequestCancelledException({this.message = 'Request dibatalkan.'});

  @override
  String toString() => 'RequestCancelledException: $message';
}
