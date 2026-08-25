import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/portfolio/presentation/pages/portfolio_page.dart';
import 'app_routes.dart';

class AppRouter {
  final GlobalKey<NavigatorState>? navigatorKey;

  AppRouter({this.navigatorKey});

  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.portfolio,
    routes: [
      GoRoute(
        path: AppRoutes.portfolio,
        builder: (context, state) => PortfolioPage.create(),
      ),
    ],
  );
}
