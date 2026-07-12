import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/token_storage.dart';
import '../../../../core/utils/repository_helper.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;
  final SharedPreferences sharedPreferences;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorage,
    required this.sharedPreferences,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    return executeApiCall(
      networkInfo: networkInfo,
      call: () async {
        final token = await remoteDataSource.login(email, password);
        await tokenStorage.saveToken(token);

        final userModel = await remoteDataSource.getProfile();
        await _saveUserLocal(userModel);

        return userModel;
      },
    );
  }

  @override
  Future<Either<Failure, User>> getProfile() async {
    return executeApiCall(
      networkInfo: networkInfo,
      call: () async {
        final userModel = await remoteDataSource.getProfile();
        await _saveUserLocal(userModel);
        return userModel;
      },
      onUnauthorized: (e) async {
        await logout();
        return Left(UnauthorizedFailure(message: e.message));
      },
      onNetworkError: () async => _getLocalUser(),
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await tokenStorage.deleteToken();
      await sharedPreferences.remove(AppConstants.userKey);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: 'Gagal menghapus sesi: $e'));
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return tokenStorage.hasToken;
  }

  // --- Helpers ---

  Future<void> _saveUserLocal(UserModel user) async {
    await sharedPreferences.setString(
      AppConstants.userKey,
      json.encode(user.toJson()),
    );
  }

  Future<Either<Failure, User>> _getLocalUser() async {
    try {
      final userJson = sharedPreferences.getString(AppConstants.userKey);
      if (userJson != null) {
        final user = UserModel.fromJson(json.decode(userJson));
        return Right(user);
      }
      return const Left(
        CacheFailure(message: 'Data pengguna tidak ditemukan di lokal'),
      );
    } catch (e) {
      return Left(CacheFailure(message: 'Gagal membaca data lokal: $e'));
    }
  }
}
