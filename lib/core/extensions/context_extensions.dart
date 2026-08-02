import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';

/// Extension on [BuildContext] for easy access to responsive utilities.
///
/// Usage:
/// ```dart
/// if (context.isMobile) { ... }
/// final padding = context.responsiveValue(mobile: 16.0, tablet: 24.0, desktop: 32.0);
/// ```
extension ResponsiveContext on BuildContext {
  /// Get the current screen width.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Get the current screen height.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Get the current [ScreenType].
  ScreenType get screenType => Breakpoints.getScreenType(screenWidth);

  /// Whether the current screen is mobile-sized.
  bool get isMobile => screenType == ScreenType.mobile;

  /// Whether the current screen is tablet-sized.
  bool get isTablet => screenType == ScreenType.tablet;

  /// Whether the current screen is desktop-sized.
  bool get isDesktop => screenType == ScreenType.desktop;

  /// Returns a value based on the current screen type.
  /// [tablet] defaults to [mobile] if not provided.
  /// [desktop] defaults to [tablet] if not provided.
  T responsiveValue<T>({required T mobile, T? tablet, T? desktop}) {
    switch (screenType) {
      case ScreenType.mobile:
        return mobile;
      case ScreenType.tablet:
        return tablet ?? mobile;
      case ScreenType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  /// Get responsive horizontal padding.
  double get horizontalPadding => Breakpoints.getHorizontalPadding(screenWidth);

  /// Get responsive spacing.
  double get spacing => Breakpoints.getSpacing(screenWidth);

  /// Get the number of grid columns for the current width.
  int get gridColumns => Breakpoints.getGridColumns(screenWidth);

  /// Quick access to the current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Quick access to the current [ColorScheme].
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Quick access to the current [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;
}
