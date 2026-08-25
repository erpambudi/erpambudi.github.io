import 'package:mobile_template/features/portfolio/domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.id,
    required super.company,
    required super.role,
    super.roleId,
    required super.period,
    super.periodId,
    required super.description,
    super.descriptionId,
    required super.highlights,
    super.highlightsId,
    required super.technologies,
    super.appUrl,
    super.isCurrent,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] as String? ?? '',
      company: json['company'] as String? ?? '',
      role: json['role'] as String? ?? '',
      roleId: json['roleId'] as String?,
      period: json['period'] as String? ?? '',
      periodId: json['periodId'] as String?,
      description: json['description'] as String? ?? '',
      descriptionId: json['descriptionId'] as String?,
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      highlightsId: (json['highlightsId'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      technologies:
          (json['technologies'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      appUrl: json['appUrl'] as String?,
      isCurrent: json['isCurrent'] as bool? ?? false,
    );
  }
}
