import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/cubit/auth_state.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/orders/presentation/pages/order_list_page.dart';
import 'app_routes.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

class AppRouter {
  final AuthCubit authCubit;
  final GlobalKey<NavigatorState>? navigatorKey;

  AppRouter({required this.authCubit, this.navigatorKey});

  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splash,

    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      final authState = authCubit.state;
      final isGoingToLogin = state.matchedLocation == AppRoutes.login;
      final isSplash = state.matchedLocation == AppRoutes.splash;

      if (authState is AuthInitialState) {
        return isSplash ? null : AppRoutes.splash;
      }

      if (authState is AuthLoadingState) {
        return null; // Stay on current page while loading
      }

      if (authState is AuthUnauthenticatedState ||
          authState is AuthErrorState) {
        if (!isGoingToLogin) return AppRoutes.login;
        return null; // Stay on login
      }

      if (authState is AuthAuthenticatedState) {
        if (isGoingToLogin || isSplash) {
          return AppRoutes.orders;
        }
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.orders,
        builder: (context, state) => OrderListPage.create(),
      ),
    ],
  );
}
