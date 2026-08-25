import 'package:equatable/equatable.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/experience_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';
import 'package:mobile_template/features/portfolio/domain/entities/certificate_entity.dart';

abstract class PortfolioState extends Equatable {
  const PortfolioState();

  @override
  List<Object?> get props => [];
}

class PortfolioInitialState extends PortfolioState {
  const PortfolioInitialState();
}

class PortfolioLoadingState extends PortfolioState {
  const PortfolioLoadingState();
}

class PortfolioLoadedState extends PortfolioState {
  final ProfileEntity profile;
  final List<ExperienceEntity> experiences;
  final List<ProjectEntity> projects;
  final List<SkillCategoryEntity> skillCategories;
  final List<CertificateEntity> certificates;
  final ProjectCategory selectedCategory;
  final String activeNavSection;

  const PortfolioLoadedState({
    required this.profile,
    required this.experiences,
    required this.projects,
    required this.skillCategories,
    required this.certificates,
    this.selectedCategory = ProjectCategory.all,
    this.activeNavSection = 'home',
  });

  List<ProjectEntity> get filteredProjects {
    if (selectedCategory == ProjectCategory.all) {
      return projects;
    }
    return projects.where((p) => p.category == selectedCategory).toList();
  }

  PortfolioLoadedState copyWith({
    ProfileEntity? profile,
    List<ExperienceEntity>? experiences,
    List<ProjectEntity>? projects,
    List<SkillCategoryEntity>? skillCategories,
    List<CertificateEntity>? certificates,
    ProjectCategory? selectedCategory,
    String? activeNavSection,
  }) {
    return PortfolioLoadedState(
      profile: profile ?? this.profile,
      experiences: experiences ?? this.experiences,
      projects: projects ?? this.projects,
      skillCategories: skillCategories ?? this.skillCategories,
      certificates: certificates ?? this.certificates,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      activeNavSection: activeNavSection ?? this.activeNavSection,
    );
  }

  @override
  List<Object?> get props => [
    profile,
    experiences,
    projects,
    skillCategories,
    certificates,
    selectedCategory,
    activeNavSection,
  ];
}

class PortfolioErrorState extends PortfolioState {
  final String message;

  const PortfolioErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
