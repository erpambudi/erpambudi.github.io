import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/typography_extension.dart';

class _MenuItem {
  final IconData icon;
  final String title;
  final Color color;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.color,
  });
}

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      const _MenuItem(
        icon: Icons.edit_rounded,
        title: 'Edit Profil',
        color: AppColors.primary,
      ),
      const _MenuItem(
        icon: Icons.lock_rounded,
        title: 'Ubah Password',
        color: AppColors.statusDicuci,
      ),
      const _MenuItem(
        icon: Icons.notifications_rounded,
        title: 'Notifikasi',
        color: AppColors.accent,
      ),
      const _MenuItem(
        icon: Icons.help_rounded,
        title: 'Bantuan',
        color: AppColors.statusDiterima,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
      ),
      child: Column(
        children: [
          for (int i = 0; i < menuItems.length; i++) ...[
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 4,
              ),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: menuItems[i].color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  menuItems[i].icon,
                  size: 20,
                  color: menuItems[i].color,
                ),
              ),
              title: Text(
                menuItems[i].title,
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppColors.textLight,
              ),
              onTap: () {},
            ),
            if (i < menuItems.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}
