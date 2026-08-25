import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/injection_container.dart';
import '../cubit/portfolio_cubit.dart';
import '../cubit/portfolio_state.dart';
import '../layouts/portfolio_desktop_layout.dart';
import '../layouts/portfolio_mobile_layout.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  static Widget create() {
    return BlocProvider<PortfolioCubit>(
      create: (_) => sl<PortfolioCubit>()..loadPortfolioData(),
      child: const PortfolioPage(),
    );
  }

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _certificatesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;
    switch (section) {
      case 'home':
        targetKey = _homeKey;
        break;
      case 'about':
        targetKey = _aboutKey;
        break;
      case 'skills':
        targetKey = _skillsKey;
        break;
      case 'experience':
        targetKey = _experienceKey;
        break;
      case 'projects':
        targetKey = _projectsKey;
        break;
      case 'certificates':
        targetKey = _certificatesKey;
        break;
      case 'contact':
        targetKey = _contactKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
      context.read<PortfolioCubit>().setActiveNavSection(section);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PortfolioCubit, PortfolioState>(
        builder: (context, state) {
          if (state is PortfolioLoadingState ||
              state is PortfolioInitialState) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state is PortfolioErrorState) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 48,
                    color: AppColors.error,
                  ),
                  const SizedBox(height: 16),
                  Text(state.message, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<PortfolioCubit>().loadPortfolioData(),
                    child: Text(context.l10n.retry),
                  ),
                ],
              ),
            );
          }

          if (state is PortfolioLoadedState) {
            if (context.isDesktop) {
              return PortfolioDesktopLayout(
                state: state,
                scrollController: _scrollController,
                homeKey: _homeKey,
                aboutKey: _aboutKey,
                skillsKey: _skillsKey,
                experienceKey: _experienceKey,
                projectsKey: _projectsKey,
                certificatesKey: _certificatesKey,
                contactKey: _contactKey,
                onNavTap: _scrollToSection,
              );
            } else {
              return PortfolioMobileLayout(
                state: state,
                scrollController: _scrollController,
                homeKey: _homeKey,
                aboutKey: _aboutKey,
                skillsKey: _skillsKey,
                experienceKey: _experienceKey,
                projectsKey: _projectsKey,
                certificatesKey: _certificatesKey,
                contactKey: _contactKey,
                onNavTap: _scrollToSection,
              );
            }
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
