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

  Color _getGroupColor(SkillGroup group) {
    switch (group) {
      case SkillGroup.languages:
        return AppColors.primary;
      case SkillGroup.frameworks:
        return AppColors.secondary;
      case SkillGroup.architecture:
        return AppColors.accent;
      case SkillGroup.hardwareNative:
        return AppColors.purple;
      case SkillGroup.databases:
        return AppColors.amber;
      case SkillGroup.cloudBackend:
        return AppColors.pink;
      case SkillGroup.toolsDevOps:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isId = Localizations.localeOf(context).languageCode == 'id';
    final groupColor = _getGroupColor(widget.category.group);
    final groupIcon = _getGroupIcon(widget.category.group);
    final groupTitle = isId
        ? widget.category.groupNameId
        : widget.category.groupName;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: _isHovered
                ? groupColor.withValues(alpha: 0.6)
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
            width: _isHovered ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? groupColor.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
              blurRadius: _isHovered ? 16 : 8,
              offset: const Offset(0, 4),
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: groupColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(groupIcon, color: groupColor, size: 22),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    groupTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
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
