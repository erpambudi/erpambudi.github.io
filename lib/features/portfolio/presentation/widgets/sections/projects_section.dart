import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import '../cards/project_card.dart';
import 'package:mobile_template/features/portfolio/presentation/cubit/portfolio_cubit.dart';

class ProjectsSection extends StatelessWidget {
  final List<ProjectEntity> projects;
  final ProjectCategory selectedCategory;

  const ProjectsSection({
    super.key,
    required this.projects,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = context.isDesktop;
    final isTablet = context.isTablet;

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
          const SizedBox(height: 20),
          _buildCategoryFilters(context, isDark),
          const SizedBox(height: 28),
          _buildProjectsGrid(context, isDesktop, isTablet),
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
              context.l10n.navProjects.toUpperCase(),
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
          context.l10n.projectsTitle,
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
          context.l10n.projectsSubtitle,
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

  Widget _buildCategoryFilters(BuildContext context, bool isDark) {
    final cubit = context.read<PortfolioCubit>();

    final filters = [
      (ProjectCategory.all, context.l10n.filterAll),
      (ProjectCategory.mobile, context.l10n.filterMobile),
      (ProjectCategory.desktop, context.l10n.filterDesktop),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: filters.map((f) {
        final isSelected = selectedCategory == f.$1;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            mouseCursor: SystemMouseCursors.click,
            borderRadius: BorderRadius.circular(8),
            onTap: () => cubit.selectCategory(f.$1),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : (isDark ? AppColors.cardDark : const Color(0xFFF1F5F9)),
                borderRadius: BorderRadius.circular(8),
                border: isSelected
                    ? null
                    : Border.all(
                        color: isDark
                            ? AppColors.borderDark
                            : AppColors.borderLight,
                      ),
              ),
              child: Text(
                f.$2,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? Colors.white
                      : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProjectsGrid(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
  ) {
    if (projects.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Text(context.l10n.emptyData),
        ),
      );
    }

    if (isDesktop) {
      final col1 = <ProjectEntity>[];
      final col2 = <ProjectEntity>[];
      final col3 = <ProjectEntity>[];

      for (int i = 0; i < projects.length; i++) {
        if (i % 3 == 0) col1.add(projects[i]);
        if (i % 3 == 1) col2.add(projects[i]);
        if (i % 3 == 2) col3.add(projects[i]);
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: col1
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ProjectCard(project: p),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: col2
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ProjectCard(project: p),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: col3
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ProjectCard(project: p),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else if (isTablet) {
      final col1 = <ProjectEntity>[];
      final col2 = <ProjectEntity>[];

      for (int i = 0; i < projects.length; i++) {
        if (i % 2 == 0) col1.add(projects[i]);
        if (i % 2 == 1) col2.add(projects[i]);
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: col1
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ProjectCard(project: p),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: col2
                  .map(
                    (p) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ProjectCard(project: p),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: projects
            .map(
              (p) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProjectCard(project: p),
              ),
            )
            .toList(),
      );
    }
  }
}
