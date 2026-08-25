import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import '../badges/status_indicator.dart';
import '../buttons/hero_cta_button.dart';
import '../buttons/social_icon_button.dart';

class HeroTextContent extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroTextContent({
    super.key,
    required this.profile,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  Future<void> _downloadCv() async {
    final uri = Uri.parse(profile.resumeUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = context.isDesktop;
    final locale = Localizations.localeOf(context).languageCode;
    final nameFontSize = context.responsiveValue(
      mobile: 28.0,
      tablet: 34.0,
      desktop: 40.0,
    );

    return Column(
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        StatusIndicator(text: context.l10n.availableForWork),
        const SizedBox(height: 16),
        Text(
          context.l10n.heroGreeting,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          profile.name,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            fontSize: nameFontSize,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          profile.title,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          profile.getTagline(locale),
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            height: 1.6,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            HeroCtaButton(
              label: context.l10n.contactMe,
              icon: Icons.send_rounded,
              onPressed: onContactTap,
              isPrimary: true,
            ),
            HeroCtaButton(
              label: context.l10n.downloadCv,
              icon: Icons.download_rounded,
              onPressed: _downloadCv,
              isPrimary: false,
            ),
            HeroCtaButton(
              label: context.l10n.exploreProjects,
              icon: Icons.grid_view_rounded,
              onPressed: onProjectsTap,
              isPrimary: false,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
          children: [
            SocialIconButton(
              icon: Icons.code_rounded,
              url: profile.githubUrl,
              tooltip: 'GitHub Profile',
              hoverColor: AppColors.primary,
            ),
            SocialIconButton(
              icon: Icons.work_rounded,
              url: profile.linkedInUrl,
              tooltip: 'LinkedIn Profile',
              hoverColor: AppColors.primary,
            ),
            SocialIconButton(
              icon: Icons.chat_rounded,
              url: profile.whatsAppUrl,
              tooltip: 'WhatsApp Chat',
              hoverColor: AppColors.primary,
            ),
            SocialIconButton(
              icon: Icons.email_rounded,
              url: 'mailto:${profile.email}',
              tooltip: 'Send Email',
              hoverColor: AppColors.primary,
            ),
            SocialIconButton(
              icon: Icons.camera_alt_rounded,
              url: profile.instagramUrl,
              tooltip: 'Instagram',
              hoverColor: AppColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
