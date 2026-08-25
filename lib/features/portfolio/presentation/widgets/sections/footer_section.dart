import 'package:flutter/material.dart';
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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              // Back to Top Button
              IconButton.filledTonal(
                onPressed: onBackToTop,
                icon: const Icon(Icons.arrow_upward_rounded, size: 20),
                tooltip: 'Back to Top',
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
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
          ),
        ],
      ),
    );
  }
}
