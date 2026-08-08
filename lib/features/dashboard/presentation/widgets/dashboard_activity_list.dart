import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';
import '../../../../core/utils/l10n_extension.dart';

class ActivityItemData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const ActivityItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });
}

class DashboardActivityList extends StatelessWidget {
  const DashboardActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      ActivityItemData(
        icon: Icons.add_circle_rounded,
        title: 'Order baru #1234',
        subtitle: context.l10n.twoMinutesAgo,
        color: AppColors.statusDiterima,
      ),
      ActivityItemData(
        icon: Icons.local_laundry_service_rounded,
        title: 'Order #1230 sedang dicuci',
        subtitle: context.l10n.fifteenMinutesAgo,
        color: AppColors.statusDicuci,
      ),
      ActivityItemData(
        icon: Icons.check_circle_rounded,
        title: 'Order #1228 selesai',
        subtitle: context.l10n.oneHourAgo,
        color: AppColors.statusSelesai,
      ),
      ActivityItemData(
        icon: Icons.payment_rounded,
        title: 'Pembayaran diterima #1225',
        subtitle: context.l10n.twoHoursAgo,
        color: AppColors.statusLunas,
      ),
      ActivityItemData(
        icon: Icons.person_add_rounded,
        title: context.l10n.newCustomerRegistered,
        subtitle: context.l10n.threeHoursAgo,
        color: AppColors.primary,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.recentActivity,
          style: context.titleLarge.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: activity.color.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(activity.icon, size: 20, color: activity.color),
                ),
                title: Text(
                  activity.title,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  activity.subtitle,
                  style: context.bodySmall.copyWith(color: AppColors.textLight),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: AppColors.textLight,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
