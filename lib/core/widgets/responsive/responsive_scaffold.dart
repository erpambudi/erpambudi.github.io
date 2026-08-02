import 'package:flutter/material.dart';
import '../../constants/breakpoints.dart';
import '../../theme/app_colors.dart';

/// A navigation destination for the responsive scaffold.
class AppDestination {
  final IconData icon;
  final IconData? selectedIcon;
  final String label;

  const AppDestination({
    required this.icon,
    this.selectedIcon,
    required this.label,
  });
}

/// A responsive scaffold that automatically adapts its navigation based on
/// screen width.
///
/// - **Mobile** (< 600px): Shows a [NavigationBar] at the bottom
/// - **Tablet** (600-1024px): Shows a [NavigationRail] on the left
/// - **Desktop** (> 1024px): Shows a permanent sidebar on the left
///
/// This widget uses [LayoutBuilder] to respond to the actual available width,
/// so resizing a desktop window will smoothly transition between layouts.
///
/// Usage:
/// ```dart
/// ResponsiveScaffold(
///   currentIndex: _selectedIndex,
///   onDestinationSelected: (index) => setState(() => _selectedIndex = index),
///   destinations: [
///     AppDestination(icon: Icons.home_outlined, selectedIcon: Icons.home, label: 'Home'),
///     AppDestination(icon: Icons.person_outline, selectedIcon: Icons.person, label: 'Profile'),
///   ],
///   body: pages[_selectedIndex],
/// )
/// ```
class ResponsiveScaffold extends StatelessWidget {
  /// The currently selected destination index.
  final int currentIndex;

  /// Callback when a destination is selected.
  final ValueChanged<int> onDestinationSelected;

  /// The list of navigation destinations.
  final List<AppDestination> destinations;

  /// The main body content.
  final Widget body;

  /// Optional app bar title.
  final String? title;

  /// Optional floating action button.
  final Widget? floatingActionButton;

  const ResponsiveScaffold({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.body,
    this.title,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final screenType = Breakpoints.getScreenType(width);

        switch (screenType) {
          case ScreenType.mobile:
            return _buildMobileLayout(context);
          case ScreenType.tablet:
            return _buildTabletLayout(context);
          case ScreenType.desktop:
            return _buildDesktopLayout(context);
        }
      },
    );
  }

  /// Mobile layout: content + bottom navigation bar.
  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: SafeArea(child: body),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations
            .map(
              (d) => NavigationDestination(
                icon: Icon(d.icon),
                selectedIcon: Icon(d.selectedIcon ?? d.icon),
                label: d.label,
              ),
            )
            .toList(),
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  /// Tablet layout: navigation rail + content.
  Widget _buildTabletLayout(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: title != null ? AppBar(title: Text(title!)) : null,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            onDestinationSelected: onDestinationSelected,
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Icon(
                Icons.dashboard_rounded,
                color: theme.colorScheme.primary,
                size: 32,
              ),
            ),
            destinations: destinations
                .map(
                  (d) => NavigationRailDestination(
                    icon: Icon(d.icon),
                    selectedIcon: Icon(d.selectedIcon ?? d.icon),
                    label: Text(d.label),
                  ),
                )
                .toList(),
          ),
          VerticalDivider(thickness: 1, width: 1, color: theme.dividerColor),
          Expanded(child: SafeArea(child: body)),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  /// Desktop layout: permanent sidebar + content.
  Widget _buildDesktopLayout(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          Container(
            width: Breakpoints.sidebarWidth,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(
                right: BorderSide(color: theme.dividerColor, width: 1),
              ),
            ),
            child: Column(
              children: [
                // Sidebar header / branding
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.dashboard_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'App Template',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                const SizedBox(height: 8),
                // Navigation items
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final dest = destinations[index];
                      final isSelected = index == currentIndex;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: () => onDestinationSelected(index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? colorScheme.primary.withValues(alpha: 0.1)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    isSelected
                                        ? (dest.selectedIcon ?? dest.icon)
                                        : dest.icon,
                                    size: 22,
                                    color: isSelected
                                        ? colorScheme.primary
                                        : AppColors.textSecondary,
                                  ),
                                  const SizedBox(width: 14),
                                  Text(
                                    dest.label,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                      color: isSelected
                                          ? colorScheme.primary
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Main content
          Expanded(
            child: Column(
              children: [
                if (title != null) AppBar(title: Text(title!)),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
