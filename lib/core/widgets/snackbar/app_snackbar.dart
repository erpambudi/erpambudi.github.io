import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/typography_extension.dart';

enum SnackBarType { success, error, warning, info }

/// A custom snackbar that uses Overlay to display messages.
/// This makes it independent from Navigator — navigation actions
/// (push/pop) will NOT dismiss the snackbar.
class AppSnackBar {
  AppSnackBar._();

  static OverlayEntry? _currentEntry;

  /// Show a success snackbar
  static void showSuccess(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarType.success);
  }

  /// Show an error snackbar
  static void showError(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarType.error);
  }

  /// Show a warning snackbar
  static void showWarning(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarType.warning);
  }

  /// Show an info snackbar
  static void showInfo(BuildContext context, {required String message}) {
    _show(context, message: message, type: SnackBarType.info);
  }

  static void _show(
    BuildContext context, {
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Dismiss any currently visible snackbar
    dismiss();

    final overlay = Overlay.of(context, rootOverlay: true);

    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => _SnackBarOverlay(
        message: message,
        type: type,
        duration: duration,
        onDismissed: () {
          entry.remove();
          if (_currentEntry == entry) {
            _currentEntry = null;
          }
        },
      ),
    );

    _currentEntry = entry;
    overlay.insert(entry);
  }

  /// Dismiss the currently visible snackbar
  static void dismiss() {
    _currentEntry?.remove();
    _currentEntry = null;
  }
}

class _SnackBarOverlay extends StatefulWidget {
  final String message;
  final SnackBarType type;
  final Duration duration;
  final VoidCallback onDismissed;

  const _SnackBarOverlay({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismissed,
  });

  @override
  State<_SnackBarOverlay> createState() => _SnackBarOverlayState();
}

class _SnackBarOverlayState extends State<_SnackBarOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
    );

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutCubic,
            reverseCurve: Curves.easeInCubic,
          ),
        );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    // Auto-dismiss after duration
    Future.delayed(widget.duration, () {
      if (mounted) {
        _dismiss();
      }
    });
  }

  void _dismiss() {
    _controller.reverse().then((_) {
      if (mounted) {
        widget.onDismissed();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = _getConfig(widget.type);
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Positioned(
      left: 16,
      right: 16,
      bottom: bottomPadding + 16,
      child: SlideTransition(
        position: _slideAnimation,
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onVerticalDragEnd: (details) {
                if (details.primaryVelocity != null &&
                    details.primaryVelocity! > 100) {
                  _dismiss();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: config.backgroundColor,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: config.shadowColor.withValues(alpha: 0.3),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(config.icon, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: context.bodyMedium.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: _dismiss,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SnackBarConfig {
  final Color backgroundColor;
  final Color shadowColor;
  final IconData icon;

  const _SnackBarConfig({
    required this.backgroundColor,
    required this.shadowColor,
    required this.icon,
  });
}

_SnackBarConfig _getConfig(SnackBarType type) {
  switch (type) {
    case SnackBarType.success:
      return const _SnackBarConfig(
        backgroundColor: Color(0xFF2E7D32),
        shadowColor: Color(0xFF2E7D32),
        icon: Icons.check_circle_rounded,
      );
    case SnackBarType.error:
      return _SnackBarConfig(
        backgroundColor: AppColors.error,
        shadowColor: AppColors.error,
        icon: Icons.error_rounded,
      );
    case SnackBarType.warning:
      return const _SnackBarConfig(
        backgroundColor: Color(0xFFE65100),
        shadowColor: Color(0xFFE65100),
        icon: Icons.warning_rounded,
      );
    case SnackBarType.info:
      return _SnackBarConfig(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.primary,
        icon: Icons.info_rounded,
      );
  }
}
