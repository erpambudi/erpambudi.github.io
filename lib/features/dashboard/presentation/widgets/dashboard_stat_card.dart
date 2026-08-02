import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';

class StatItemData {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const StatItemData({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
}

class DashboardStatCard extends StatelessWidget {
  final StatItemData stat;

  const DashboardStatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: stat.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(stat.icon, size: 22, color: stat.color),
          ),
          const SizedBox(height: 12),
          Text(
            stat.value,
            style: context.headlineSmall.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 2),
          Text(
            stat.label,
            style: context.bodySmall.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
