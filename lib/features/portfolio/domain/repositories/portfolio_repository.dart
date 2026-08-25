import '../entities/profile_entity.dart';
import '../entities/experience_entity.dart';
import '../entities/project_entity.dart';
import '../entities/skill_entity.dart';
import '../entities/certificate_entity.dart';

abstract class PortfolioRepository {
  Future<ProfileEntity> getProfile();
  Future<List<ExperienceEntity>> getExperiences();
  Future<List<ProjectEntity>> getProjects();
  Future<List<SkillCategoryEntity>> getSkillCategories();
  Future<List<CertificateEntity>> getCertificates();
}
