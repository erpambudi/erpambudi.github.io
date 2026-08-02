/// Breakpoint constants and screen type detection for responsive layouts.
///
/// Usage:
/// ```dart
/// final screenType = Breakpoints.getScreenType(MediaQuery.of(context).size.width);
/// ```
enum ScreenType { mobile, tablet, desktop }

class Breakpoints {
  Breakpoints._();

  /// Mobile: < 600px
  static const double mobile = 600;

  /// Tablet: 600px - 1024px
  static const double tablet = 1024;

  /// Desktop: > 1024px
  static const double desktop = 1024;

  /// Content max width for centered layouts
  static const double maxContentWidth = 1400;

  /// Sidebar width on desktop
  static const double sidebarWidth = 256;

  /// NavigationRail width on tablet
  static const double railWidth = 80;

  /// Returns the [ScreenType] based on the given [width].
  static ScreenType getScreenType(double width) {
    if (width < mobile) return ScreenType.mobile;
    if (width < desktop) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  /// Returns the number of grid columns based on [width].
  static int getGridColumns(double width) {
    if (width < mobile) return 1;
    if (width < 800) return 2;
    if (width < desktop) return 3;
    return 4;
  }

  /// Returns responsive horizontal padding based on [width].
  static double getHorizontalPadding(double width) {
    if (width < mobile) return 16;
    if (width < desktop) return 24;
    return 32;
  }

  /// Returns responsive spacing based on [width].
  static double getSpacing(double width) {
    if (width < mobile) return 12;
    if (width < desktop) return 16;
    return 20;
  }
}
