class ExperienceEntity {
  final String id;
  final String company;
  final String role;
  final String period;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final String? appUrl;
  final bool isCurrent;

  const ExperienceEntity({
    required this.id,
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    required this.highlights,
    required this.technologies,
    this.appUrl,
    this.isCurrent = false,
  });
}
