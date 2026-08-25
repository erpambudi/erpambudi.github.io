import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import 'package:mobile_template/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository repository;

  PortfolioCubit({required this.repository})
    : super(const PortfolioInitialState());

  Future<void> loadPortfolioData() async {
    emit(const PortfolioLoadingState());
    try {
      final results = await Future.wait([
        repository.getProfile(),
        repository.getExperiences(),
        repository.getProjects(),
        repository.getSkillCategories(),
        repository.getCertificates(),
      ]);

      emit(
        PortfolioLoadedState(
          profile: results[0] as dynamic,
          experiences: results[1] as dynamic,
          projects: results[2] as dynamic,
          skillCategories: results[3] as dynamic,
          certificates: results[4] as dynamic,
        ),
      );
    } catch (e) {
      emit(PortfolioErrorState(message: e.toString()));
    }
  }

  void selectCategory(ProjectCategory category) {
    if (state is PortfolioLoadedState) {
      final current = state as PortfolioLoadedState;
      emit(current.copyWith(selectedCategory: category));
    }
  }

  void setActiveNavSection(String section) {
    if (state is PortfolioLoadedState) {
      final current = state as PortfolioLoadedState;
      if (current.activeNavSection != section) {
        emit(current.copyWith(activeNavSection: section));
      }
    }
  }
}
