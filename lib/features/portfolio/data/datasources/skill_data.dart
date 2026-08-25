import 'package:mobile_template/features/portfolio/domain/entities/skill_entity.dart';

const kSkillCategoryData = [
  SkillCategoryEntity(
    group: SkillGroup.languages,
    groupName: 'Programming Languages',
    groupNameId: 'Bahasa Pemrograman',
    iconCode: 'code',
    skills: [
      SkillItem(
        name: 'Dart',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Kotlin',
        level: 'Advanced',
        proficiencyPercent: 80,
        isPrimary: true,
      ),
      SkillItem(name: 'Swift', level: 'Intermediate', proficiencyPercent: 75),
      SkillItem(name: 'Java', level: 'Advanced', proficiencyPercent: 80),
      SkillItem(
        name: 'TypeScript / Go',
        level: 'Intermediate',
        proficiencyPercent: 70,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.frameworks,
    groupName: 'Frameworks & State Management',
    groupNameId: 'Framework & State Management',
    iconCode: 'layers',
    skills: [
      SkillItem(
        name: 'Flutter (Mobile/Desktop/Web)',
        level: 'Expert',
        proficiencyPercent: 98,
        isPrimary: true,
      ),
      SkillItem(
        name: 'flutter_bloc / Cubit',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
      SkillItem(name: 'Provider', level: 'Expert', proficiencyPercent: 90),
      SkillItem(name: 'GetX', level: 'Advanced', proficiencyPercent: 85),
      SkillItem(
        name: 'GoRouter',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.architecture,
    groupName: 'Architecture & Design Patterns',
    groupNameId: 'Arsitektur & Pola Desain',
    iconCode: 'account_tree',
    skills: [
      SkillItem(
        name: 'Clean Architecture (Feature-First)',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
      SkillItem(
        name: 'SOLID Principles',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Dependency Injection (GetIt)',
        level: 'Expert',
        proficiencyPercent: 92,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Repository Pattern',
        level: 'Expert',
        proficiencyPercent: 95,
      ),
      SkillItem(
        name: 'TDD & Unit Testing',
        level: 'Advanced',
        proficiencyPercent: 85,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.hardwareNative,
    groupName: 'Hardware & Native Integrations',
    groupNameId: 'Integrasi Hardware & Native',
    iconCode: 'bluetooth',
    skills: [
      SkillItem(
        name: 'Bluetooth POS Printers (ESC/POS)',
        level: 'Expert',
        proficiencyPercent: 92,
        isPrimary: true,
      ),
      SkillItem(
        name: 'QRIS & Payment Gateways',
        level: 'Expert',
        proficiencyPercent: 90,
        isPrimary: true,
      ),
      SkillItem(
        name: 'GPS Geofencing & Google Maps',
        level: 'Expert',
        proficiencyPercent: 90,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Root / Jailbreak Detection',
        level: 'Advanced',
        proficiencyPercent: 88,
      ),
      SkillItem(
        name: 'Camera & Document Scanning',
        level: 'Advanced',
        proficiencyPercent: 85,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.databases,
    groupName: 'Databases & Local Storage',
    groupNameId: 'Penyimpanan & Database',
    iconCode: 'storage',
    skills: [
      SkillItem(
        name: 'Hive',
        level: 'Expert',
        proficiencyPercent: 92,
        isPrimary: true,
      ),
      SkillItem(
        name: 'SQLite / Sqflite',
        level: 'Expert',
        proficiencyPercent: 90,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Flutter Secure Storage',
        level: 'Expert',
        proficiencyPercent: 95,
      ),
      SkillItem(
        name: 'SharedPreferences',
        level: 'Expert',
        proficiencyPercent: 95,
      ),
      SkillItem(
        name: 'ObjectBox',
        level: 'Intermediate',
        proficiencyPercent: 75,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.cloudBackend,
    groupName: 'Cloud, APIs & Backend',
    groupNameId: 'Cloud, API & Backend',
    iconCode: 'cloud',
    skills: [
      SkillItem(
        name: 'Dio HTTP Client & Interceptors',
        level: 'Expert',
        proficiencyPercent: 95,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Firebase (FCM, Auth, Crashlytics)',
        level: 'Expert',
        proficiencyPercent: 90,
        isPrimary: true,
      ),
      SkillItem(name: 'Supabase', level: 'Advanced', proficiencyPercent: 85),
      SkillItem(
        name: 'WebSockets & Realtime',
        level: 'Advanced',
        proficiencyPercent: 88,
        isPrimary: true,
      ),
      SkillItem(
        name: 'Amplitude Analytics',
        level: 'Advanced',
        proficiencyPercent: 85,
      ),
    ],
  ),
  SkillCategoryEntity(
    group: SkillGroup.toolsDevOps,
    groupName: 'DevOps, CI/CD & Tools',
    groupNameId: 'DevOps & Perangkat Kerja',
    iconCode: 'build',
    skills: [
      SkillItem(
        name: 'Git & GitHub Actions CI/CD',
        level: 'Advanced',
        proficiencyPercent: 88,
        isPrimary: true,
      ),
      SkillItem(
        name: 'FVM (Flutter Version Management)',
        level: 'Expert',
        proficiencyPercent: 95,
      ),
      SkillItem(
        name: 'Postman & API Mocking',
        level: 'Expert',
        proficiencyPercent: 90,
      ),
      SkillItem(
        name: 'Figma to Flutter Pixel Perfect',
        level: 'Expert',
        proficiencyPercent: 92,
        isPrimary: true,
      ),
    ],
  ),
];
