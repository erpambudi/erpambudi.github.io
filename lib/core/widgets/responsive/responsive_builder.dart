import 'package:flutter/material.dart';
import '../../constants/breakpoints.dart';

/// A builder widget that provides different layouts based on the parent's
/// constraints.
///
/// Uses [LayoutBuilder] internally so it responds to the actual available
/// width, not just the screen size. This means when a desktop window is
/// resized smaller, the layout automatically switches to tablet or mobile.
///
/// Usage:
/// ```dart
/// ResponsiveBuilder(
///   mobile: (context, constraints) => MobileLayout(),
///   tablet: (context, constraints) => TabletLayout(),
///   desktop: (context, constraints) => DesktopLayout(),
/// )
/// ```
class ResponsiveBuilder extends StatelessWidget {
  /// Builder for mobile layout. Required.
  final Widget Function(BuildContext context, BoxConstraints constraints)
  mobile;

  /// Builder for tablet layout. Falls back to [mobile] if not provided.
  final Widget Function(BuildContext context, BoxConstraints constraints)?
  tablet;

  /// Builder for desktop layout. Falls back to [tablet] if not provided.
  final Widget Function(BuildContext context, BoxConstraints constraints)?
  desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final screenType = Breakpoints.getScreenType(width);

        switch (screenType) {
          case ScreenType.desktop:
            return (desktop ?? tablet ?? mobile)(context, constraints);
          case ScreenType.tablet:
            return (tablet ?? mobile)(context, constraints);
          case ScreenType.mobile:
            return mobile(context, constraints);
        }
      },
    );
  }
}
