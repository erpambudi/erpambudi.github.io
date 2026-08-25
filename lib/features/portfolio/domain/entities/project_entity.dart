enum ProjectCategory { all, mobile, desktop }

class ProjectEntity {
  final String id;
  final String title;
  final ProjectCategory category;
  final String categoryLabel;
  final String subtitle;
  final String description;
  final List<String> keyFeatures;
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
    required this.subtitle,
    required this.description,
    required this.keyFeatures,
    required this.technologies,
    required this.platforms,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    this.demoUrl,
    this.githubUrl,
    this.isFeatured = false,
  });
}
