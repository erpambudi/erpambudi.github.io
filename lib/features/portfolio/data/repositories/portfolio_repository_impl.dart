import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/experience_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/certificate_entity.dart';
import 'package:mobile_template/features/portfolio/domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<ProfileEntity> getProfile() async {
    return await localDataSource.getProfile();
  }

  @override
  Future<List<ExperienceEntity>> getExperiences() async {
    return await localDataSource.getExperiences();
  }

  @override
  Future<List<ProjectEntity>> getProjects() async {
    return await localDataSource.getProjects();
  }

  @override
  Future<List<SkillCategoryEntity>> getSkillCategories() async {
    return await localDataSource.getSkillCategories();
  }

  @override
  Future<List<CertificateEntity>> getCertificates() async {
    return await localDataSource.getCertificates();
  }
}
