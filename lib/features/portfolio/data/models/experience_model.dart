import 'package:mobile_template/features/portfolio/domain/entities/experience_entity.dart';

class ExperienceModel extends ExperienceEntity {
  const ExperienceModel({
    required super.id,
    required super.company,
    required super.role,
    required super.period,
    required super.description,
    required super.highlights,
    required super.technologies,
    super.appUrl,
    super.isCurrent,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'] as String? ?? '',
      company: json['company'] as String? ?? '',
      role: json['role'] as String? ?? '',
      period: json['period'] as String? ?? '',
      description: json['description'] as String? ?? '',
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
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
