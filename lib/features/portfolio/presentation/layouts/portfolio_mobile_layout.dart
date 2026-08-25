import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import '../cubit/portfolio_state.dart';
import '../widgets/buttons/theme_toggle_button.dart';
import '../widgets/navigation/mobile_drawer.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/certificates_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';

class PortfolioMobileLayout extends StatelessWidget {
  final PortfolioLoadedState state;
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey aboutKey;
  final GlobalKey skillsKey;
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final GlobalKey certificatesKey;
  final GlobalKey contactKey;
  final Function(String section) onNavTap;

  const PortfolioMobileLayout({
    super.key,
    required this.state,
    required this.scrollController,
    required this.homeKey,
    required this.aboutKey,
    required this.skillsKey,
    required this.experienceKey,
    required this.projectsKey,
    required this.certificatesKey,
    required this.contactKey,
    required this.onNavTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'RP',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Rizki Pambudi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
          ],
        ),
        actions: const [ThemeToggleButton(), SizedBox(width: 8)],
      ),
      drawer: MobileDrawer(
        activeSection: state.activeNavSection,
        onNavTap: onNavTap,
        onHireMeTap: () => onNavTap('contact'),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              key: homeKey,
              child: HeroSection(
                profile: state.profile,
                onContactTap: () => onNavTap('contact'),
                onProjectsTap: () => onNavTap('projects'),
              ),
            ),
            Container(
              key: aboutKey,
              child: AboutSection(profile: state.profile),
            ),
            Container(
              key: skillsKey,
              child: SkillsSection(skillCategories: state.skillCategories),
            ),
            Container(
              key: experienceKey,
              child: ExperienceSection(experiences: state.experiences),
            ),
            Container(
              key: projectsKey,
              child: ProjectsSection(
                projects: state.filteredProjects,
                selectedCategory: state.selectedCategory,
              ),
            ),
            Container(
              key: certificatesKey,
              child: CertificatesSection(certificates: state.certificates),
            ),
            Container(
              key: contactKey,
              child: ContactSection(profile: state.profile),
            ),
            FooterSection(
              profile: state.profile,
              onBackToTop: () => onNavTap('home'),
            ),
          ],
        ),
      ),
    );
  }
}
