import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';

class HeroCtaButton extends StatefulWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isPrimary;

  const HeroCtaButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  State<HeroCtaButton> createState() => _HeroCtaButtonState();
}

class _HeroCtaButtonState extends State<HeroCtaButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: widget.isPrimary
              ? (_isHovered ? AppColors.primaryDark : AppColors.primary)
              : (_isHovered
                    ? (isDark
                          ? AppColors.primary.withValues(alpha: 0.1)
                          : AppColors.primaryLight.withValues(alpha: 0.15))
                    : (isDark ? AppColors.cardDark : Colors.white)),
          borderRadius: BorderRadius.circular(10),
          border: widget.isPrimary
              ? null
              : Border.all(
                  color: _isHovered
                      ? AppColors.primary
                      : (isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
          boxShadow: widget.isPrimary
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(
                      alpha: _isHovered ? 0.3 : 0.15,
                    ),
                    blurRadius: _isHovered ? 12 : 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: widget.onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: 16,
                      color: widget.isPrimary
                          ? Colors.white
                          : (_isHovered
                                ? AppColors.primary
                                : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight)),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    widget.label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: widget.isPrimary
                          ? Colors.white
                          : (_isHovered
                                ? AppColors.primary
                                : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
