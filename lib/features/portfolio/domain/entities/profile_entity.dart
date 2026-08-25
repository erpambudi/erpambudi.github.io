class ProfileEntity {
  final String name;
  final String title;
  final String tagline;
  final String? taglineId;
  final String bio;
  final String? bioId;
  final int yearsOfExperience;
  final String location;
  final String email;
  final String phone;
  final String whatsAppUrl;
  final String linkedInUrl;
  final String githubUrl;
  final String instagramUrl;
  final String resumeUrl;
  final String avatarUrl;
  final int productionApps;
  final String activeUsers;
  final int certificationsCount;

  const ProfileEntity({
    required this.name,
    required this.title,
    required this.tagline,
    this.taglineId,
    required this.bio,
    this.bioId,
    required this.yearsOfExperience,
    required this.location,
    required this.email,
    required this.phone,
    required this.whatsAppUrl,
    required this.linkedInUrl,
    required this.githubUrl,
    required this.instagramUrl,
    required this.resumeUrl,
    required this.avatarUrl,
    required this.productionApps,
    required this.activeUsers,
    required this.certificationsCount,
  });

  String getTagline(String locale) =>
      (locale == 'id' && taglineId != null) ? taglineId! : tagline;

  String getBio(String locale) =>
      (locale == 'id' && bioId != null) ? bioId! : bio;
}
