import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';
import '../badges/skill_chip.dart';

class SkillCategoryCard extends StatefulWidget {
  final SkillCategoryEntity category;

  const SkillCategoryCard({super.key, required this.category});

  @override
  State<SkillCategoryCard> createState() => _SkillCategoryCardState();
}

class _SkillCategoryCardState extends State<SkillCategoryCard> {
  bool _isHovered = false;

  IconData _getGroupIcon(SkillGroup group) {
    switch (group) {
      case SkillGroup.languages:
        return Icons.code_rounded;
      case SkillGroup.frameworks:
        return Icons.layers_rounded;
      case SkillGroup.architecture:
        return Icons.account_tree_rounded;
      case SkillGroup.hardwareNative:
        return Icons.bluetooth_connected_rounded;
      case SkillGroup.databases:
        return Icons.storage_rounded;
      case SkillGroup.cloudBackend:
        return Icons.cloud_done_rounded;
      case SkillGroup.toolsDevOps:
        return Icons.terminal_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isId = Localizations.localeOf(context).languageCode == 'id';
    final groupIcon = _getGroupIcon(widget.category.group);
    final groupTitle = isId
        ? widget.category.groupNameId
        : widget.category.groupName;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppColors.primary.withValues(alpha: 0.5)
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
              blurRadius: _isHovered ? 12 : 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.folder_outlined,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Icon(groupIcon, color: AppColors.primary, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    groupTitle,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: widget.category.skills.map((skill) {
                return SkillChip(
                  label: skill.name,
                  level: skill.level,
                  isPrimary: skill.isPrimary,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
