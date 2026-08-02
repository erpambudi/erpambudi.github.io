import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';

class ProfileHeader extends StatelessWidget {
  final double? avatarRadius;

  const ProfileHeader({super.key, this.avatarRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: avatarRadius ?? (context.isMobile ? 40 : 50),
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Icon(
              Icons.person_rounded,
              size: avatarRadius ?? (context.isMobile ? 40 : 50),
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Admin User',
            style: context.headlineSmall.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 4),
          Text(
            'admin@example.com',
            style: context.bodyMedium.copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.accent.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Administrator',
              style: context.labelMedium.copyWith(color: AppColors.accent),
            ),
          ),
        ],
      ),
    );
  }
}
