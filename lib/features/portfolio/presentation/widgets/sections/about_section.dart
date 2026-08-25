import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';

class AboutSection extends StatelessWidget {
  final ProfileEntity profile;

  const AboutSection({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = context.isDesktop;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsiveValue(
          mobile: 20.0,
          tablet: 36.0,
          desktop: 64.0,
        ),
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(context, isDark),
          const SizedBox(height: 28),
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: _buildBioText(context, isDark)),
                const SizedBox(width: 40),
                Expanded(flex: 5, child: _buildPillarsGrid(context, isDark)),
              ],
            )
          else ...[
            _buildBioText(context, isDark),
            const SizedBox(height: 28),
            _buildPillarsGrid(context, isDark),
          ],
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 24,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              context.l10n.aboutTitle.toUpperCase(),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.aboutSubtitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildBioText(BuildContext context, bool isDark) {
    final locale = Localizations.localeOf(context).languageCode;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.getBio(locale),
          style: TextStyle(
            fontSize: 14,
            height: 1.7,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _buildInfoTile(
              Icons.location_on_rounded,
              context.l10n.location,
              profile.location,
              isDark,
            ),
            _buildInfoTile(
              Icons.email_rounded,
              context.l10n.emailLabel,
              profile.email,
              isDark,
            ),
            _buildInfoTile(
              Icons.phone_rounded,
              context.l10n.phoneLabel,
              profile.phone,
              isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoTile(
    IconData icon,
    String label,
    String value,
    bool isDark,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.primary),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPillarsGrid(BuildContext context, bool isDark) {
    final pillars = [
      (
        context.l10n.pillarCleanTitle,
        context.l10n.pillarCleanDesc,
        Icons.architecture_rounded,
      ),
      (
        context.l10n.pillarOmniTitle,
        context.l10n.pillarOmniDesc,
        Icons.devices_other_rounded,
      ),
      (
        context.l10n.pillarOfflineTitle,
        context.l10n.pillarOfflineDesc,
        Icons.sync_rounded,
      ),
      (
        context.l10n.pillarResponsiveTitle,
        context.l10n.pillarResponsiveDesc,
        Icons.auto_awesome_rounded,
      ),
    ];

    return Column(
      children: pillars.map((p) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(p.$3, color: AppColors.primary, size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      p.$1,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      p.$2,
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
