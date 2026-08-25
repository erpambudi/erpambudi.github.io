import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import '../hero/hero_avatar_visual.dart';
import '../hero/hero_metrics_grid.dart';
import '../hero/hero_text_content.dart';

class HeroSection extends StatelessWidget {
  final ProfileEntity profile;
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.profile,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsiveValue(
          mobile: 20.0,
          tablet: 36.0,
          desktop: 64.0,
        ),
        vertical: context.responsiveValue(
          mobile: 32.0,
          tablet: 48.0,
          desktop: 64.0,
        ),
      ),
      child: Column(
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: HeroTextContent(
                    profile: profile,
                    onContactTap: onContactTap,
                    onProjectsTap: onProjectsTap,
                  ),
                ),
                const SizedBox(width: 48),
                Expanded(
                  flex: 5,
                  child: HeroAvatarVisual(avatarUrl: profile.avatarUrl),
                ),
              ],
            )
          else ...[
            HeroAvatarVisual(avatarUrl: profile.avatarUrl),
            const SizedBox(height: 36),
            HeroTextContent(
              profile: profile,
              onContactTap: onContactTap,
              onProjectsTap: onProjectsTap,
            ),
          ],
          const SizedBox(height: 48),
          HeroMetricsGrid(profile: profile),
        ],
      ),
    );
  }
}
