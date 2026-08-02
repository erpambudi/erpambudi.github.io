import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';

class DashboardWelcomeHeader extends StatelessWidget {
  final bool showIcon;

  const DashboardWelcomeHeader({super.key, this.showIcon = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang! 👋',
                  style: context.titleLarge.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Kelola semua aktivitas Anda dari sini.',
                  style: context.bodyMedium.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
          if (showIcon)
            const Icon(
              Icons.dashboard_rounded,
              size: 64,
              color: Colors.white24,
            ),
        ],
      ),
    );
  }
}
