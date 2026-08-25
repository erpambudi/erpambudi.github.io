import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_template/core/theme/app_colors.dart';

class SocialIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;
  final Color? hoverColor;

  const SocialIconButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.hoverColor,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  Future<void> _launch() async {
    final uri = Uri.parse(widget.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final activeColor = widget.hoverColor ?? AppColors.primary;

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isHovered
                ? activeColor.withValues(alpha: 0.12)
                : (isDark ? AppColors.cardDark : AppColors.surfaceLight),
            border: Border.all(
              color: _isHovered
                  ? activeColor
                  : (isDark ? AppColors.borderDark : AppColors.borderLight),
            ),
          ),
          child: IconButton(
            icon: Icon(
              widget.icon,
              size: 18,
              color: _isHovered
                  ? activeColor
                  : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
            ),
            onPressed: _launch,
          ),
        ),
      ),
    );
  }
}
