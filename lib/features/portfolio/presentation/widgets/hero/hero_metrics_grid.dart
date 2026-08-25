import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import '../cards/metric_stat_card.dart';

class HeroMetricsGrid extends StatelessWidget {
  final ProfileEntity profile;

  const HeroMetricsGrid({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final isDesktop = context.isDesktop;
    final isTablet = context.isTablet;

    final cards = [
      MetricStatCard(
        value: '${profile.yearsOfExperience}+',
        label: context.l10n.yearsExperience,
        icon: Icons.history_rounded,
        accentColor: AppColors.primary,
      ),
      MetricStatCard(
        value: '${profile.productionApps}+',
        label: context.l10n.appsShipped,
        icon: Icons.rocket_launch_rounded,
        accentColor: AppColors.secondary,
      ),
      MetricStatCard(
        value: profile.activeUsers,
        label: context.l10n.happyUsers,
        icon: Icons.people_alt_rounded,
        accentColor: AppColors.accent,
      ),
      MetricStatCard(
        value: '${profile.certificationsCount}',
        label: context.l10n.certifiedSkills,
        icon: Icons.verified_rounded,
        accentColor: AppColors.purple,
      ),
    ];

    if (isDesktop) {
      return Row(
        children: cards
            .map(
              (c) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: c,
                ),
              ),
            )
            .toList(),
      );
    } else if (isTablet) {
      return Column(
        children: [
          Row(
            children: [
              Expanded(child: cards[0]),
              const SizedBox(width: 14),
              Expanded(child: cards[1]),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: cards[2]),
              const SizedBox(width: 14),
              Expanded(child: cards[3]),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: cards
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 12), child: c),
            )
            .toList(),
      );
    }
  }
}
