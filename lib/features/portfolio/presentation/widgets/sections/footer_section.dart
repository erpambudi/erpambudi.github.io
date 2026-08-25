import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import '../buttons/social_icon_button.dart';

class FooterSection extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback onBackToTop;

  const FooterSection({
    super.key,
    required this.profile,
    required this.onBackToTop,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = context.isDesktop;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : const Color(0xFFF1F5F9),
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.borderDark : AppColors.borderLight,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'RP',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Rizki Pambudi',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              IconButton.filledTonal(
                onPressed: onBackToTop,
                icon: const Icon(Icons.arrow_upward_rounded, size: 18),
                tooltip: 'Back to Top',
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          if (isDesktop)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    context.l10n.copyright,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    SocialIconButton(
                      icon: Icons.code_rounded,
                      url: profile.githubUrl,
                      tooltip: 'GitHub',
                    ),
                    SocialIconButton(
                      icon: Icons.work_rounded,
                      url: profile.linkedInUrl,
                      tooltip: 'LinkedIn',
                    ),
                    SocialIconButton(
                      icon: Icons.chat_rounded,
                      url: profile.whatsAppUrl,
                      tooltip: 'WhatsApp',
                    ),
                  ],
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    SocialIconButton(
                      icon: Icons.code_rounded,
                      url: profile.githubUrl,
                      tooltip: 'GitHub',
                    ),
                    SocialIconButton(
                      icon: Icons.work_rounded,
                      url: profile.linkedInUrl,
                      tooltip: 'LinkedIn',
                    ),
                    SocialIconButton(
                      icon: Icons.chat_rounded,
                      url: profile.whatsAppUrl,
                      tooltip: 'WhatsApp',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  context.l10n.copyright,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark
                        ? AppColors.textMutedDark
                        : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
