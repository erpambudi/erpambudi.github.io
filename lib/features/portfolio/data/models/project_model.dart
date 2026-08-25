import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    required super.id,
    required super.title,
    required super.category,
    required super.categoryLabel,
    super.categoryLabelId,
    required super.subtitle,
    super.subtitleId,
    required super.description,
    super.descriptionId,
    required super.keyFeatures,
    super.keyFeaturesId,
    required super.technologies,
    required super.platforms,
    required super.imagePath,
    super.playStoreUrl,
    super.appStoreUrl,
    super.demoUrl,
    super.githubUrl,
    super.isFeatured,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    ProjectCategory parseCategory(String? cat) {
      switch (cat) {
        case 'desktop':
          return ProjectCategory.desktop;
        case 'mobile':
        default:
          return ProjectCategory.mobile;
      }
    }

    return ProjectModel(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      category: parseCategory(json['category'] as String?),
      categoryLabel: json['categoryLabel'] as String? ?? 'Mobile App',
      categoryLabelId: json['categoryLabelId'] as String?,
      subtitle: json['subtitle'] as String? ?? '',
      subtitleId: json['subtitleId'] as String?,
      description: json['description'] as String? ?? '',
      descriptionId: json['descriptionId'] as String?,
      keyFeatures:
          (json['keyFeatures'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      keyFeaturesId: (json['keyFeaturesId'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      technologies:
          (json['technologies'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      platforms:
          (json['platforms'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      imagePath: json['imagePath'] as String? ?? '',
      playStoreUrl: json['playStoreUrl'] as String?,
      appStoreUrl: json['appStoreUrl'] as String?,
      demoUrl: json['demoUrl'] as String?,
      githubUrl: json['githubUrl'] as String?,
      isFeatured: json['isFeatured'] as bool? ?? false,
    );
  }
}
