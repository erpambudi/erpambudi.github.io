import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import '../contact/contact_form_card.dart';
import '../contact/contact_info_tiles.dart';

class ContactSection extends StatelessWidget {
  final ProfileEntity profile;

  const ContactSection({super.key, required this.profile});

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
                Expanded(flex: 5, child: ContactInfoTiles(profile: profile)),
                const SizedBox(width: 40),
                Expanded(flex: 6, child: ContactFormCard(profile: profile)),
              ],
            )
          else ...[
            ContactInfoTiles(profile: profile),
            const SizedBox(height: 24),
            ContactFormCard(profile: profile),
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
              context.l10n.navContact.toUpperCase(),
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
          context.l10n.contactTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          context.l10n.contactSubtitle,
          style: TextStyle(
            fontSize: 14,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }
}
