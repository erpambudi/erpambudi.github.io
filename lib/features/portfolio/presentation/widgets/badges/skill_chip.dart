import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final String? level;
  final bool isPrimary;

  const SkillChip({
    super.key,
    required this.label,
    this.level,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final bg = isPrimary
        ? (isDark
              ? AppColors.primary.withValues(alpha: 0.15)
              : AppColors.primaryLight.withValues(alpha: 0.25))
        : (isDark ? AppColors.cardDarkHover : const Color(0xFFF1F5F9));

    final textColor = isPrimary
        ? AppColors.primary
        : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);

    final borderColor = isPrimary
        ? AppColors.primary.withValues(alpha: 0.4)
        : (isDark ? AppColors.borderDark : AppColors.borderLight);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPrimary) ...[
            const Icon(Icons.star_rounded, size: 14, color: AppColors.amber),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
              color: textColor,
            ),
          ),
          if (level != null) ...[
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: isDark ? Colors.black26 : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                level!,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
