import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.name,
    required super.title,
    required super.tagline,
    super.taglineId,
    required super.bio,
    super.bioId,
    required super.yearsOfExperience,
    required super.location,
    required super.email,
    required super.phone,
    required super.whatsAppUrl,
    required super.linkedInUrl,
    required super.githubUrl,
    required super.instagramUrl,
    required super.resumeUrl,
    required super.avatarUrl,
    required super.productionApps,
    required super.activeUsers,
    required super.certificationsCount,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      tagline: json['tagline'] as String? ?? '',
      taglineId: json['taglineId'] as String?,
      bio: json['bio'] as String? ?? '',
      bioId: json['bioId'] as String?,
      yearsOfExperience: json['yearsOfExperience'] as int? ?? 0,
      location: json['location'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      whatsAppUrl: json['whatsAppUrl'] as String? ?? '',
      linkedInUrl: json['linkedInUrl'] as String? ?? '',
      githubUrl: json['githubUrl'] as String? ?? '',
      instagramUrl: json['instagramUrl'] as String? ?? '',
      resumeUrl: json['resumeUrl'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      productionApps: json['productionApps'] as int? ?? 0,
      activeUsers: json['activeUsers'] as String? ?? '',
      certificationsCount: json['certificationsCount'] as int? ?? 0,
    );
  }
}
