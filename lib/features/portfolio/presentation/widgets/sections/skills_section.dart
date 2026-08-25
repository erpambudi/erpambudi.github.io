import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';
import '../cards/skill_category_card.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillCategoryEntity> skillCategories;

  const SkillsSection({super.key, required this.skillCategories});

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
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          _buildSectionHeader(context, isDark),
          const SizedBox(height: 32),
          // Skills Matrix
          _buildSkillsGrid(context, isDesktop, isTablet),
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
              width: 32,
              height: 3,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              context.l10n.navSkills.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.skillsTitle,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.skillsSubtitle,
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

  Widget _buildSkillsGrid(BuildContext context, bool isDesktop, bool isTablet) {
    if (isDesktop) {
      // 2-column or 3-column layout
      final leftColumn = <SkillCategoryEntity>[];
      final rightColumn = <SkillCategoryEntity>[];

      for (int i = 0; i < skillCategories.length; i++) {
        if (i % 2 == 0) {
          leftColumn.add(skillCategories[i]);
        } else {
          rightColumn.add(skillCategories[i]);
        }
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: leftColumn
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SkillCategoryCard(category: c),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: rightColumn
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SkillCategoryCard(category: c),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: skillCategories
            .map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SkillCategoryCard(category: c),
              ),
            )
            .toList(),
      );
    }
  }
}
