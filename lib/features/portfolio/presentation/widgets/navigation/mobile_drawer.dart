import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/core/bloc/locale/locale_cubit.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import '../buttons/theme_toggle_button.dart';

class MobileDrawer extends StatelessWidget {
  final String activeSection;
  final Function(String section) onNavTap;
  final VoidCallback onHireMeTap;

  const MobileDrawer({
    super.key,
    required this.activeSection,
    required this.onNavTap,
    required this.onHireMeTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Widget buildDrawerItem(String sectionKey, String label, IconData icon) {
      final isActive = activeSection == sectionKey;
      return ListTile(
        mouseCursor: SystemMouseCursors.click,
        leading: Icon(
          icon,
          color: isActive
              ? AppColors.primary
              : (isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight),
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            color: isActive
                ? AppColors.primary
                : (isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight),
          ),
        ),
        selected: isActive,
        selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () {
          Navigator.of(context).pop();
          onNavTap(sectionKey);
        },
      );
    }

    return Drawer(
      backgroundColor: isDark ? AppColors.surfaceDark : Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'RP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Rizki Pambudi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 8),
              // Menu items
              buildDrawerItem('home', context.l10n.navHome, Icons.home_rounded),
              buildDrawerItem(
                'about',
                context.l10n.navAbout,
                Icons.person_rounded,
              ),
              buildDrawerItem(
                'skills',
                context.l10n.navSkills,
                Icons.code_rounded,
              ),
              buildDrawerItem(
                'experience',
                context.l10n.navExperience,
                Icons.work_history_rounded,
              ),
              buildDrawerItem(
                'projects',
                context.l10n.navProjects,
                Icons.devices_rounded,
              ),
              buildDrawerItem(
                'certificates',
                context.l10n.navCertificates,
                Icons.workspace_premium_rounded,
              ),
              buildDrawerItem(
                'contact',
                context.l10n.navContact,
                Icons.mail_rounded,
              ),
              const Spacer(),
              const Divider(),
              const SizedBox(height: 8),
              // Language & Theme
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<LocaleCubit, Locale>(
                    builder: (context, locale) {
                      final isId = locale.languageCode == 'id';
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          mouseCursor: SystemMouseCursors.click,
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {
                            context.read<LocaleCubit>().changeLocale(
                              Locale(isId ? 'en' : 'id'),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.cardDark
                                  : const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isDark
                                    ? AppColors.borderDark
                                    : AppColors.borderLight,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.language_rounded, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  isId ? 'Bahasa (ID)' : 'English (EN)',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const ThemeToggleButton(),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onHireMeTap();
                  },
                  child: Text(context.l10n.contactMe),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
