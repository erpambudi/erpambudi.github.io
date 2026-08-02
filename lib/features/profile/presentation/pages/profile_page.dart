import 'package:flutter/material.dart';
import '../../../../core/widgets/responsive/responsive_builder.dart';
import '../layouts/profile_mobile_layout.dart';
import '../layouts/profile_desktop_layout.dart';

/// Profile page demonstrating responsive layout.
///
/// Refactored to delegate to specific mobile/desktop layouts.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: (context, constraints) => const ProfileMobileLayout(),
      desktop: (context, constraints) => const ProfileDesktopLayout(),
    );
  }
}
