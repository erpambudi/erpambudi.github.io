class ExperienceEntity {
  final String id;
  final String company;
  final String role;
  final String? roleId;
  final String period;
  final String? periodId;
  final String description;
  final String? descriptionId;
  final List<String> highlights;
  final List<String>? highlightsId;
  final List<String> technologies;
  final String? appUrl;
  final bool isCurrent;

  const ExperienceEntity({
    required this.id,
    required this.company,
    required this.role,
    this.roleId,
    required this.period,
    this.periodId,
    required this.description,
    this.descriptionId,
    required this.highlights,
    this.highlightsId,
    required this.technologies,
    this.appUrl,
    this.isCurrent = false,
  });

  String getRole(String locale) =>
      (locale == 'id' && roleId != null) ? roleId! : role;

  String getPeriod(String locale) =>
      (locale == 'id' && periodId != null) ? periodId! : period;

  String getDescription(String locale) =>
      (locale == 'id' && descriptionId != null) ? descriptionId! : description;

  List<String> getHighlights(String locale) =>
      (locale == 'id' && highlightsId != null) ? highlightsId! : highlights;
}
