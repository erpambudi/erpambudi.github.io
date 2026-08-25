import '../models/profile_model.dart';
import '../models/experience_model.dart';
import '../models/project_model.dart';
import '../models/certificate_model.dart';
import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';
import 'profile_data.dart';
import 'experience_data.dart';
import 'project_data.dart';
import 'skill_data.dart';
import 'certificate_data.dart';

abstract class PortfolioLocalDataSource {
  Future<ProfileModel> getProfile();
  Future<List<ExperienceModel>> getExperiences();
  Future<List<ProjectModel>> getProjects();
  Future<List<SkillCategoryEntity>> getSkillCategories();
  Future<List<CertificateModel>> getCertificates();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<ProfileModel> getProfile() async => kProfileData;

  @override
  Future<List<ExperienceModel>> getExperiences() async => kExperienceData;

  @override
  Future<List<ProjectModel>> getProjects() async => kProjectData;

  @override
  Future<List<SkillCategoryEntity>> getSkillCategories() async =>
      kSkillCategoryData;

  @override
  Future<List<CertificateModel>> getCertificates() async => kCertificateData;
}
