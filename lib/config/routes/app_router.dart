import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/l10n_extension.dart';
import '../../core/widgets/responsive/responsive_scaffold.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/splash_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/orders/presentation/pages/order_list_page.dart';
import '../../features/portfolio/presentation/pages/portfolio_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
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

  /// Navigation destinations — add new pages here.
  /// Order matters: it determines the display order in navigation.
  static List<AppDestination> getDestinations(BuildContext context) => [
    AppDestination(
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard_rounded,
      label: context.l10n.dashboard,
    ),
    AppDestination(
      icon: Icons.receipt_long_outlined,
      selectedIcon: Icons.receipt_long_rounded,
      label: context.l10n.orders,
    ),
    AppDestination(
      icon: Icons.person_outline_rounded,
      selectedIcon: Icons.person_rounded,
      label: context.l10n.profile,
    ),
  ];

  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.portfolio,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    routes: [
      // Portfolio Main Landing Route
      GoRoute(
        path: AppRoutes.portfolio,
        builder: (context, state) => PortfolioPage.create(),
      ),
      // Auth routes (outside shell)
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),

      // Main shell routes (after login) with ResponsiveScaffold
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return _ScaffoldWithNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.dashboard,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: DashboardPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.orders,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: OrderListPage.create()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Internal widget that wraps the navigation shell with [ResponsiveScaffold].
class _ScaffoldWithNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const _ScaffoldWithNavigation({required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      currentIndex: navigationShell.currentIndex,
      onDestinationSelected: (index) {
        navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        );
      },
      destinations: AppRouter.getDestinations(context),
      body: navigationShell,
    );
  }
}
