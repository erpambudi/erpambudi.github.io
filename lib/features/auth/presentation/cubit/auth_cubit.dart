import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit({required this.repository}) : super(AuthInitialState());

  Future<void> checkAuthStatus() async {
    emit(AuthLoadingState());

    // Beri sedikit jeda untuk splash screen (opsional)
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await repository.isLoggedIn();

    if (isLoggedIn) {
      final result = await repository.getProfile();
      result.fold(
        (failure) {
          // Jika gagal get profile (misal token expired), paksa logout
          emit(AuthUnauthenticatedState(message: failure.message));
        },
        (user) {
          emit(AuthAuthenticatedState(user: user));
        },
      );
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoadingState());

    final result = await repository.login(email, password);

    result.fold(
      (failure) {
        emit(AuthErrorState(message: failure.message));
        // Kembalikan ke state unauthenticated agar form bisa diisi lagi
        emit(AuthUnauthenticatedState());
      },
      (user) {
        emit(AuthAuthenticatedState(user: user));
      },
    );
  }

  Future<void> logout() async {
    emit(AuthLoadingState());

    final result = await repository.logout();

    result.fold(
      (failure) {
        emit(AuthErrorState(message: failure.message));
        // Meskipun gagal di server, paksa unauthenticated di lokal
        emit(AuthUnauthenticatedState());
      },
      (_) {
        emit(AuthUnauthenticatedState(message: 'Berhasil logout'));
      },
    );
  }

  /// Dipanggil saat interceptor menangkap error 401 Unauthorized
  void forceLogout() {
    emit(
      AuthUnauthenticatedState(
        message: 'Sesi telah berakhir. Silakan login kembali.',
      ),
    );
  }
}
