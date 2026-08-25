import '../models/project_model.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';

const kProjectData = [
  ProjectModel(
    id: 'proj_jubelio_chat',
    title: 'Jubelio Chat',
    category: ProjectCategory.desktop,
    categoryLabel: 'Multiplatform (Mobile & Desktop)',
    subtitle: 'Omnichannel marketplace chat aggregator for enterprise sellers',
    description:
        'A unified multi-platform chat workspace connecting merchants with buyers across Shopee, Tokopedia, TikTok Shop, and Lazada. Available on Android, iOS, Windows, and macOS.',
    keyFeatures: [
      'Omnichannel messaging aggregation for major marketplaces',
      'Real-time WebSocket message synchronization',
      'Desktop window management & tray notifications',
      'Quick product insertion & auto-reply templates',
    ],
    technologies: [
      'Flutter',
      'BLoC',
      'WebSockets',
      'Window Manager',
      'Desktop Flutter',
    ],
    platforms: ['Android', 'iOS', 'macOS', 'Windows'],
    imagePath: 'assets/images/porto/p0.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.jubelio.chat',
    isFeatured: true,
  ),
  ProjectModel(
    id: 'proj_jubelio_shipment',
    title: 'Jubelio Shipment',
    category: ProjectCategory.mobile,
    categoryLabel: 'Mobile App',
    subtitle: 'Courier logistics & shipping aggregator for e-commerce',
    description:
        'End-to-end shipping management mobile application. Enables e-commerce merchants to book pickups, compare 3PL courier rates, print airway bills, and track parcel deliveries in real time.',
    keyFeatures: [
      'Multi-courier rate comparison & booking',
      'Automated pickup scheduling & package dimension calculation',
      'Real-time shipment tracking with courier API webhooks',
    ],
    technologies: ['Flutter', 'BLoC', 'Dio', 'Clean Architecture', 'REST API'],
    platforms: ['Android', 'iOS'],
    imagePath: 'assets/images/porto/p4.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.jubelio.shipment',
    isFeatured: true,
  ),
  ProjectModel(
    id: 'proj_holigo',
    title: 'Holigo',
    category: ProjectCategory.mobile,
    categoryLabel: 'Mobile App',
    subtitle: 'Online Travel Agent (OTA) & digital product booking platform',
    description:
        'Comprehensive B2B lifestyle and travel app providing hotel reservations, flight & train tickets, digital utility bill payments (PPOB), and digital wallets.',
    keyFeatures: [
      'Hotel and flight booking engine with calendar picker',
      'Train seat selection & instant ticket issuance',
      'PPOB utility bill payments & multi-channel payment gateway',
    ],
    technologies: ['Flutter', 'Provider', 'Firebase Cloud Messaging', 'Dio'],
    platforms: ['Android', 'iOS'],
    imagePath: 'assets/images/porto/p1.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.droid.sip&pcampaignid=web_share',
    isFeatured: true,
  ),
  ProjectModel(
    id: 'proj_jakteam',
    title: 'JakTeam (Bank DKI)',
    category: ProjectCategory.mobile,
    categoryLabel: 'Enterprise Mobile App',
    subtitle: 'Enterprise HRIS attendance & employee management system',
    description:
        'Official HRIS mobile application for Bank DKI Jakarta employees, featuring secure GPS geofenced attendance, face verification camera, and leave requests.',
    keyFeatures: [
      'GPS geofencing attendance validation with radius checks',
      'In-app camera snapshot with anti-spoofing logic',
      'Leave approvals and shift management system',
    ],
    technologies: [
      'Flutter',
      'GetX',
      'Google Maps API',
      'Geolocator',
      'Camera',
    ],
    platforms: ['Android', 'iOS'],
    imagePath: 'assets/images/porto/p2.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=id.co.bankdki.jakteam',
  ),
  ProjectModel(
    id: 'proj_atm_bsi',
    title: 'ATM Management (Bank Syariah Indonesia)',
    category: ProjectCategory.mobile,
    categoryLabel: 'Enterprise Mobile App',
    subtitle: 'Field ATM maintenance & GPS tracking for bank engineers',
    description:
        'Enterprise maintenance app for Bank Syariah Indonesia technicians to audit, service, and log cash refill visits for ATM machines across Indonesia.',
    keyFeatures: [
      'Interactive ATM location map navigation with Google Maps',
      'Maintenance checklist & cash level telemetry logging',
      'Offline report caching with auto-sync',
    ],
    technologies: ['Flutter', 'Google Maps', 'SQLite', 'Clean Architecture'],
    platforms: ['Android'],
    imagePath: 'assets/images/porto/p6.png',
  ),
  ProjectModel(
    id: 'proj_kelola_laundry',
    title: 'Kelola Laundry POS',
    category: ProjectCategory.mobile,
    categoryLabel: 'Mobile App',
    subtitle: 'Complete laundry business POS & order management system',
    description:
        'All-in-one cashier and laundry tracking system for laundromat owners. Handles order workflows from drop-off, washing, drying, ironing, to pickup and receipts.',
    keyFeatures: [
      'Multi-stage laundry status tracker',
      'Bluetooth thermal receipt printing',
      'Customer CRM & SMS/WhatsApp notification trigger',
    ],
    technologies: ['Flutter', 'BLoC', 'Hive Storage', 'Bluetooth Print'],
    platforms: ['Android'],
    imagePath: 'assets/images/porto/p3.png',
    demoUrl:
        'https://drive.google.com/file/d/1NstDw5eJoitoTGEJpNmz7wr5KaqIll0x/view?usp=drive_link',
  ),
  ProjectModel(
    id: 'proj_medime',
    title: 'Medime Medication Reminder',
    category: ProjectCategory.mobile,
    categoryLabel: 'Mobile App',
    subtitle: 'Smart daily medication reminder & health log tracker',
    description:
        'User-friendly medication companion app that schedules recurring medicine alarms, tracks dosage history, and logs health metrics.',
    keyFeatures: [
      'Exact local notification alarms even when device is asleep',
      'Prescription adherence analytics and dosage logging',
    ],
    technologies: ['Flutter', 'Local Notifications', 'SQLite', 'Provider'],
    platforms: ['Android'],
    imagePath: 'assets/images/porto/p5.png',
    demoUrl:
        'https://drive.google.com/file/d/1Zu4SwjB9rk-WcRmjsb8wGnKL9Dndj1c_/view?usp=drive_link',
  ),
];
