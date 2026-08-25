import '../models/project_model.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';

const kProjectData = [
  ProjectModel(
    id: 'proj_jubelio_chat',
    title: 'Jubelio Chat',
    category: ProjectCategory.desktop,
    categoryLabel: 'Multiplatform (Mobile & Desktop)',
    categoryLabelId: 'Multiplatform (Mobile & Desktop)',
    subtitle: 'Omnichannel marketplace chat aggregator for enterprise sellers',
    subtitleId:
        'Agregator chat marketplace omnichannel untuk penjual enterprise',
    description:
        'A unified multi-platform chat workspace connecting merchants with buyers across Shopee, Tokopedia, TikTok Shop, and Lazada. Available on Android, iOS, Windows, and macOS.',
    descriptionId:
        'Aplikasi chat multiplatform terpadu yang menghubungkan penjual dengan pembeli dari Shopee, Tokopedia, TikTok Shop, dan Lazada dalam satu tempat. Tersedia di Android, iOS, Windows, dan macOS.',
    keyFeatures: [
      'Omnichannel messaging aggregation for major marketplaces',
      'Real-time WebSocket message synchronization',
      'Desktop window management & tray notifications',
      'Quick product insertion & auto-reply templates',
    ],
    keyFeaturesId: [
      'Agregasi pesan omnichannel dari berbagai marketplace utama',
      'Sinkronisasi pesan real-time menggunakan WebSocket',
      'Manajemen jendela desktop & notifikasi system tray',
      'Template balasan cepat & penyisipan info produk otomatis',
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
    categoryLabelId: 'Aplikasi Mobile',
    subtitle: 'Courier logistics & shipping aggregator for e-commerce',
    subtitleId: 'Agregator pengiriman kurir & logistik untuk e-commerce',
    description:
        'End-to-end shipping management mobile application. Enables e-commerce merchants to book pickups, compare 3PL courier rates, print airway bills, and track parcel deliveries in real time.',
    descriptionId:
        'Aplikasi mobile manajemen pengiriman terpadu. Memungkinkan penjual e-commerce memesan pickup kurir, membandingkan tarif 3PL, mencetak resi pengiriman, dan melacak paket secara real-time.',
    keyFeatures: [
      'Multi-courier rate comparison & booking',
      'Automated pickup scheduling & package dimension calculation',
      'Real-time shipment tracking with courier API webhooks',
    ],
    keyFeaturesId: [
      'Perbandingan tarif & pemesanan kurir multi-ekspedisi',
      'Penjadwalan pickup otomatis & kalkulasi dimensi paket',
      'Pelacakan status resi pengiriman secara real-time',
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
    categoryLabelId: 'Aplikasi Mobile',
    subtitle: 'Online Travel Agent (OTA) & digital product booking platform',
    subtitleId: 'Platform Online Travel Agent (OTA) & pemesanan produk digital',
    description:
        'Comprehensive B2B lifestyle and travel app providing hotel reservations, flight & train tickets, digital utility bill payments (PPOB), and digital wallets.',
    descriptionId:
        'Aplikasi travel dan gaya hidup B2B lengkap yang menyediakan reservasi hotel, tiket pesawat & kereta api, pembayaran tagihan utilitas digital (PPOB), dan dompet digital.',
    keyFeatures: [
      'Hotel and flight booking engine with calendar picker',
      'Train seat selection & instant ticket issuance',
      'PPOB utility bill payments & multi-channel payment gateway',
    ],
    keyFeaturesId: [
      'Pemesanan hotel & tiket pesawat dengan kalender interaktif',
      'Pemilihan kursi gerbong kereta api & penerbitan tiket instan',
      'Pembayaran tagihan utilitas PPOB & integrasi payment gateway',
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
    categoryLabelId: 'Aplikasi Mobile Enterprise',
    subtitle: 'Enterprise HRIS attendance & employee management system',
    subtitleId: 'Sistem absensi HRIS enterprise & manajemen karyawan bank',
    description:
        'Official HRIS mobile application for Bank DKI Jakarta employees, featuring secure GPS geofenced attendance, face verification camera, and leave requests.',
    descriptionId:
        'Aplikasi mobile HRIS resmi untuk karyawan Bank DKI Jakarta, dengan absensi berbasis GPS geofencing aman, verifikasi kamera wajah, dan pengajuan cuti online.',
    keyFeatures: [
      'GPS geofencing attendance validation with radius checks',
      'In-app camera snapshot with anti-spoofing logic',
      'Leave approvals and shift management system',
    ],
    keyFeaturesId: [
      'Validasi absensi GPS geofencing dengan verifikasi radius kantor',
      'Pengambilan foto kamera dalam aplikasi dengan proteksi anti-spoofing',
      'Sistem pengajuan izin cuti dan manajemen shift karyawan',
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
    categoryLabelId: 'Aplikasi Mobile Enterprise',
    subtitle: 'Field ATM maintenance & GPS tracking for bank engineers',
    subtitleId: 'Pemeliharaan mesin ATM lapangan & pelacakan GPS teknisi bank',
    description:
        'Enterprise maintenance app for Bank Syariah Indonesia technicians to audit, service, and log cash refill visits for ATM machines across Indonesia.',
    descriptionId:
        'Aplikasi pemeliharaan enterprise untuk teknisi Bank Syariah Indonesia untuk mengaudit, memperbaiki, dan mencatat pengisian kas mesin ATM di seluruh Indonesia.',
    keyFeatures: [
      'Interactive ATM location map navigation with Google Maps',
      'Maintenance checklist & cash level telemetry logging',
      'Offline report caching with auto-sync',
    ],
    keyFeaturesId: [
      'Navigasi peta lokasi ATM interaktif dengan Google Maps',
      'Daftar periksa pemeliharaan & pencatatan telemetri saldo kas',
      'Penyimpanan laporan offline dengan sinkronisasi otomatis',
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
    categoryLabelId: 'Aplikasi Mobile',
    subtitle: 'Complete laundry business POS & order management system',
    subtitleId: 'Sistem POS kasir & manajemen pesanan laundry lengkap',
    description:
        'All-in-one cashier and laundry tracking system for laundromat owners. Handles order workflows from drop-off, washing, drying, ironing, to pickup and receipts.',
    descriptionId:
        'Sistem kasir dan pelacakan pesanan laundry terpadu. Mengelola alur kerja dari penerimaan, pencucian, pengeringan, penyetrikaan, hingga pengambilan dan cetak struk.',
    keyFeatures: [
      'Multi-stage laundry status tracker',
      'Bluetooth thermal receipt printing',
      'Customer CRM & SMS/WhatsApp notification trigger',
    ],
    keyFeaturesId: [
      'Pelacakan status pesanan bertahap (cuci, kering, setrika, selesai)',
      'Pencetakan struk nota via printer thermal Bluetooth',
      'Manajemen pelanggan (CRM) & notifikasi otomatis WhatsApp',
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
    categoryLabelId: 'Aplikasi Mobile',
    subtitle: 'Smart daily medication reminder & health log tracker',
    subtitleId:
        'Pengingat minum obat harian pintar & pencatat riwayat kesehatan',
    description:
        'User-friendly medication companion app that schedules recurring medicine alarms, tracks dosage history, and logs health metrics.',
    descriptionId:
        'Aplikasi pendamping minum obat yang menjadwalkan alarm pengingat berkala, mencatat riwayat dosis obat, dan merekam data kesehatan harian pengguna.',
    keyFeatures: [
      'Exact local notification alarms even when device is asleep',
      'Prescription adherence analytics and dosage logging',
    ],
    keyFeaturesId: [
      'Alarm notifikasi lokal tepat waktu bahkan saat perangkat dalam mode tidur',
      'Analitik kepatuhan resep dokter dan pencatatan riwayat dosis',
    ],
    technologies: ['Flutter', 'Local Notifications', 'SQLite', 'Provider'],
    platforms: ['Android'],
    imagePath: 'assets/images/porto/p5.png',
    demoUrl:
        'https://drive.google.com/file/d/1Zu4SwjB9rk-WcRmjsb8wGnKL9Dndj1c_/view?usp=drive_link',
  ),
];
