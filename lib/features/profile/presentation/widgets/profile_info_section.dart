import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';
import '../../../../core/utils/l10n_extension.dart';

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final infoItems = [
      _InfoItem(
        icon: Icons.phone_rounded,
        label: context.l10n.phone,
        value: '+62 812 3456 7890',
      ),
      _InfoItem(
        icon: Icons.location_on_rounded,
        label: context.l10n.address,
        value: 'Jl. Contoh No. 123, Jakarta',
      ),
      _InfoItem(
        icon: Icons.calendar_month_rounded,
        label: context.l10n.joined,
        value: '1 Januari 2024',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Text(
              'Informasi Akun',
              style: context.titleMedium.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          ...infoItems.map(
            (item) => ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 2,
              ),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(item.icon, size: 20, color: AppColors.primary),
              ),
              title: Text(
                item.label,
                style: context.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              subtitle: Text(
                item.value,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
