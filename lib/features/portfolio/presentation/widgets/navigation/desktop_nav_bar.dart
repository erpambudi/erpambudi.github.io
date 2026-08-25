import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/core/bloc/locale/locale_cubit.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import '../buttons/theme_toggle_button.dart';
import 'nav_item.dart';

class DesktopNavBar extends StatelessWidget {
  final String activeSection;
  final Function(String section) onNavTap;
  final VoidCallback onHireMeTap;

  const DesktopNavBar({
    super.key,
    required this.activeSection,
    required this.onNavTap,
    required this.onHireMeTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          height: 72,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: (isDark ? AppColors.backgroundDark : Colors.white)
                .withValues(alpha: 0.82),
            border: Border(
              bottom: BorderSide(
                color: isDark ? AppColors.borderDark : AppColors.borderLight,
              ),
            ),
          ),
          child: Row(
            children: [
              // Logo
              InkWell(
                onTap: () => onNavTap('home'),
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
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
                      const SizedBox(width: 10),
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
              ),
              const Spacer(),
              // Nav Items
              NavItem(
                label: context.l10n.navHome,
                isActive: activeSection == 'home',
                onTap: () => onNavTap('home'),
              ),
              NavItem(
                label: context.l10n.navAbout,
                isActive: activeSection == 'about',
                onTap: () => onNavTap('about'),
              ),
              NavItem(
                label: context.l10n.navSkills,
                isActive: activeSection == 'skills',
                onTap: () => onNavTap('skills'),
              ),
              NavItem(
                label: context.l10n.navExperience,
                isActive: activeSection == 'experience',
                onTap: () => onNavTap('experience'),
              ),
              NavItem(
                label: context.l10n.navProjects,
                isActive: activeSection == 'projects',
                onTap: () => onNavTap('projects'),
              ),
              NavItem(
                label: context.l10n.navCertificates,
                isActive: activeSection == 'certificates',
                onTap: () => onNavTap('certificates'),
              ),
              NavItem(
                label: context.l10n.navContact,
                isActive: activeSection == 'contact',
                onTap: () => onNavTap('contact'),
              ),
              const SizedBox(width: 16),
              // Language Switcher
              BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  final isId = locale.languageCode == 'id';
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      context.read<LocaleCubit>().changeLocale(
                        Locale(isId ? 'en' : 'id'),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.language_rounded, size: 16),
                          const SizedBox(width: 6),
                          Text(
                            isId ? 'ID' : 'EN',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 10),
              // Theme Toggle
              const ThemeToggleButton(),
              const SizedBox(width: 14),
              // Hire Me / Contact CTA
              ElevatedButton(
                onPressed: onHireMeTap,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                ),
                child: Text(context.l10n.contactMe),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
