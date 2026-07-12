import 'package:dartz/dartz.dart';

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
    } on UnauthorizedException catch (e) {
      if (onUnauthorized != null) {
        return await onUnauthorized(e);
      }
      return Left(UnauthorizedFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on NetworkException catch (e) {
      if (onNetworkError != null) {
        return await onNetworkError();
      }
      return Left(NetworkFailure(message: e.message));
    } on ApiTimeoutException catch (e) {
      return Left(TimeoutFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: 'Terjadi kesalahan: $e'));
    }
  } else {
    if (onNetworkError != null) {
      return await onNetworkError();
    }
    return const Left(NetworkFailure());
  }
}
