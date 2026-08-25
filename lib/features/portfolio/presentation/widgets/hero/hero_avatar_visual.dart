import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';

class HeroAvatarVisual extends StatelessWidget {
  final String avatarUrl;

  const HeroAvatarVisual({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final avatarSize = context.responsiveValue(
      mobile: 180.0,
      tablet: 220.0,
      desktop: 240.0,
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: avatarSize,
            height: avatarSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.6),
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(
                    alpha: isDark ? 0.25 : 0.15,
                  ),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(4),
            child: ClipOval(
              child: Container(
                color: isDark
                    ? const Color(0xFF0F172A)
                    : const Color(0xFFE2E8F0),
                child: Image.asset(
                  avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, error, stackTrace) => const Icon(
                    Icons.person_rounded,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Badges in a safe Wrap
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _buildBadge(
                context.l10n.badgeFlutterExpert,
                AppColors.primary,
                isDark,
              ),
              _buildBadge(
                context.l10n.badgeCleanArch,
                AppColors.secondary,
                isDark,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, Color color, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isDark
              ? AppColors.textPrimaryDark
              : AppColors.textPrimaryLight,
        ),
      ),
    );
  }
}
