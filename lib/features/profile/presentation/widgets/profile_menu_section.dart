import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/bloc/locale/locale_cubit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/theme/typography_extension.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';

class _MenuItem {
  final IconData icon;
  final String title;
  final Color color;
  final VoidCallback? onTap;
  final Widget? trailing;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.color,
    this.onTap,
    this.trailing,
  });
}

class ProfileMenuSection extends StatelessWidget {
  const ProfileMenuSection({super.key});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.l10n.confirmLogoutTitle),
        content: Text(context.l10n.confirmLogoutContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: Text(context.l10n.logout),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    final localeCubit = context.read<LocaleCubit>();
    final currentLocale = localeCubit.state.languageCode;

    showDialog(
      context: context,
      builder: (dialogContext) => SimpleDialog(
        title: Text(context.l10n.language),
        children: [
          RadioGroup<String>(
            groupValue: currentLocale,
            onChanged: (value) {
              if (value != null) {
                localeCubit.changeLocale(Locale(value));
                Navigator.pop(dialogContext);
              }
            },
            child: Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Bahasa Indonesia'),
                  value: 'id',
                  activeColor: AppColors.primary,
                ),
                RadioListTile<String>(
                  title: const Text('English'),
                  value: 'en',
                  activeColor: AppColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _currentLanguageLabel(BuildContext context) {
    final code = context.read<LocaleCubit>().state.languageCode;
    return code == 'id' ? 'Indonesia' : 'English';
  }

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _MenuItem(
        icon: Icons.edit_rounded,
        title: context.l10n.editProfile,
        color: AppColors.primary,
      ),
      _MenuItem(
        icon: Icons.lock_outline_rounded,
        title: context.l10n.changePassword,
        color: AppColors.statusDicuci,
      ),
      _MenuItem(
        icon: Icons.notifications_none_rounded,
        title: context.l10n.notifications,
        color: AppColors.accent,
      ),
      _MenuItem(
        icon: Icons.help_outline_rounded,
        title: context.l10n.help,
        color: AppColors.statusDiterima,
      ),
      _MenuItem(
        icon: Icons.language_rounded,
        title: context.l10n.language,
        color: AppColors.primaryDark,
        onTap: () => _showLanguageDialog(context),
        trailing: Text(
          _currentLanguageLabel(context),
          style: context.bodyMedium.copyWith(color: AppColors.textSecondary),
        ),
      ),
      _MenuItem(
        icon: Icons.logout_rounded,
        title: context.l10n.logout,
        color: AppColors.error,
        onTap: () => _showLogoutConfirmation(context),
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
              trailing:
                  menuItems[i].trailing ??
                  const Icon(Icons.chevron_right, color: AppColors.textLight),
              onTap: menuItems[i].onTap ?? () {},
            ),
            if (i < menuItems.length - 1) const Divider(height: 1),
          ],
        ],
      ),
    );
  }
}
