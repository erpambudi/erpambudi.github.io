enum SkillGroup {
  languages,
  frameworks,
  architecture,
  databases,
  cloudBackend,
  hardwareNative,
  toolsDevOps,
}

class SkillItem {
  final String name;
  final String level;
  final int proficiencyPercent;
  final bool isPrimary;

  const SkillItem({
    required this.name,
    required this.level,
    required this.proficiencyPercent,
    this.isPrimary = false,
  });
}

class SkillCategoryEntity {
  final SkillGroup group;
  final String groupName;
  final String groupNameId;
  final String iconCode;
  final List<SkillItem> skills;

  const SkillCategoryEntity({
    required this.group,
    required this.groupName,
    required this.groupNameId,
    required this.iconCode,
    required this.skills,
  });
}
