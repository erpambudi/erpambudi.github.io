import 'package:flutter/material.dart';
import '../../../../core/constants/breakpoints.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/l10n_extension.dart';
import '../widgets/dashboard_welcome_header.dart';
import '../widgets/dashboard_stat_card.dart';
import '../widgets/dashboard_activity_list.dart';

class DashboardDesktopLayout extends StatelessWidget {
  const DashboardDesktopLayout({super.key});

  List<StatItemData> _getStats(BuildContext context) {
    return [
      StatItemData(
        icon: Icons.receipt_long_rounded,
        label: context.l10n.totalOrder,
        value: '128',
        color: AppColors.statusDiterima,
      ),
      StatItemData(
        icon: Icons.hourglass_bottom_rounded,
        label: context.l10n.inProgress,
        value: '24',
        color: AppColors.statusDicuci,
      ),
      StatItemData(
        icon: Icons.check_circle_rounded,
        label: context.l10n.completed,
        value: '96',
        color: AppColors.statusSelesai,
      ),
      StatItemData(
        icon: Icons.payments_rounded,
        label: context.l10n.revenue,
        value: 'Rp 12.5jt',
        color: AppColors.accent,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final stats = _getStats(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(context.horizontalPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.maxContentWidth,
          ),
          child: context.isTablet
              ? _buildTabletLayout(context, stats)
              : _buildDesktopLayout(context, stats),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, List<StatItemData> stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardWelcomeHeader(showIcon: true),
        SizedBox(height: context.spacing),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: context.spacing,
            mainAxisSpacing: context.spacing,
            childAspectRatio: 1.6,
          ),
          itemCount: stats.length,
          itemBuilder: (context, index) {
            return DashboardStatCard(stat: stats[index]);
          },
        ),
        SizedBox(height: context.spacing),
        const DashboardActivityList(),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context, List<StatItemData> stats) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DashboardWelcomeHeader(showIcon: true),
              SizedBox(height: context.spacing),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: context.spacing,
                  mainAxisSpacing: context.spacing,
                  childAspectRatio: 1.0,
                ),
                itemCount: stats.length,
                itemBuilder: (context, index) {
                  return DashboardStatCard(stat: stats[index]);
                },
              ),
            ],
          ),
        ),
        SizedBox(width: context.spacing),
        const Expanded(flex: 1, child: DashboardActivityList()),
      ],
    );
  }
}
