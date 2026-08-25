enum ProjectCategory { all, mobile, desktop }

class ProjectEntity {
  final String id;
  final String title;
  final ProjectCategory category;
  final String categoryLabel;
  final String? categoryLabelId;
  final String subtitle;
  final String? subtitleId;
  final String description;
  final String? descriptionId;
  final List<String> keyFeatures;
  final List<String>? keyFeaturesId;
  final List<String> technologies;
  final List<String> platforms;
  final String imagePath;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? demoUrl;
  final String? githubUrl;
  final bool isFeatured;

  const ProjectEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.categoryLabel,
    this.categoryLabelId,
    required this.subtitle,
    this.subtitleId,
    required this.description,
    this.descriptionId,
    required this.keyFeatures,
    this.keyFeaturesId,
    required this.technologies,
    required this.platforms,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    this.demoUrl,
    this.githubUrl,
    this.isFeatured = false,
  });

  String getCategoryLabel(String locale) =>
      (locale == 'id' && categoryLabelId != null)
      ? categoryLabelId!
      : categoryLabel;

  String getSubtitle(String locale) =>
      (locale == 'id' && subtitleId != null) ? subtitleId! : subtitle;

  String getDescription(String locale) =>
      (locale == 'id' && descriptionId != null) ? descriptionId! : description;

  List<String> getKeyFeatures(String locale) =>
      (locale == 'id' && keyFeaturesId != null) ? keyFeaturesId! : keyFeatures;
}
