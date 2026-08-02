import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive/responsive_builder.dart';
import '../layouts/dashboard_mobile_layout.dart';
import '../layouts/dashboard_desktop_layout.dart';

/// Dashboard page as the main landing page after login.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context, constraints) => const DashboardMobileLayout(),
      desktop: (context, constraints) => const DashboardDesktopLayout(),
    );
  }
}
