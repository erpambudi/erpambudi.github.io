import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';

class HeroAvatarVisual extends StatelessWidget {
  final String avatarUrl;

  const HeroAvatarVisual({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Ambient Glow
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.primary.withValues(alpha: 0.35),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Main Avatar Container
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 28,
                  offset: const Offset(0, 8),
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
                    size: 100,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ),
          // Floating Tech Badge Top-Right (Flutter)
          Positioned(
            top: 0,
            right: -10,
            child: _buildFloatingBadge(
              'Flutter Expert 🚀',
              AppColors.primary,
              isDark,
            ),
          ),
          // Floating Tech Badge Bottom-Left (Clean Arch)
          Positioned(
            bottom: 10,
            left: -15,
            child: _buildFloatingBadge(
              'Clean Architecture ⚡',
              AppColors.accent,
              isDark,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingBadge(String text, Color color, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.25),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : AppColors.textPrimaryLight,
        ),
      ),
    );
  }
}
