import 'package:flutter/material.dart';
import '../cubit/portfolio_state.dart';
import '../widgets/navigation/desktop_nav_bar.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/certificates_section.dart';
import '../widgets/sections/contact_section.dart';
import '../widgets/sections/experience_section.dart';
import '../widgets/sections/footer_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/projects_section.dart';
import '../widgets/sections/skills_section.dart';

class PortfolioDesktopLayout extends StatelessWidget {
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

  const PortfolioDesktopLayout({
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
    return Stack(
      children: [
        // Scrollable Content
        SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(height: 72), // Navbar spacing
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1280),
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
                        child: SkillsSection(
                          skillCategories: state.skillCategories,
                        ),
                      ),
                      Container(
                        key: experienceKey,
                        child: ExperienceSection(
                          experiences: state.experiences,
                        ),
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
                        child: CertificatesSection(
                          certificates: state.certificates,
                        ),
                      ),
                      Container(
                        key: contactKey,
                        child: ContactSection(profile: state.profile),
                      ),
                    ],
                  ),
                ),
              ),
              FooterSection(
                profile: state.profile,
                onBackToTop: () => onNavTap('home'),
              ),
            ],
          ),
        ),
        // Floating Top Navbar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: DesktopNavBar(
            activeSection: state.activeNavSection,
            onNavTap: onNavTap,
            onHireMeTap: () => onNavTap('contact'),
          ),
        ),
      ],
    );
  }
}
