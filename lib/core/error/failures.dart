import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({
    super.message = 'Sesi telah berakhir. Silakan login kembali.',
  });
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message = 'Koneksi timeout. Silakan coba lagi.'});
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure({super.message = 'Request dibatalkan.'});
}
