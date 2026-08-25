import '../models/experience_model.dart';

const kExperienceData = [
  ExperienceModel(
    id: 'exp_1',
    company: 'PT Guardia Teknologi Indonesia (Jubelio)',
    role: 'Senior Flutter Developer',
    roleId: 'Senior Flutter Developer',
    period: 'Mar 2023 - Present',
    periodId: 'Maret 2023 - Sekarang',
    description:
        'Leading Flutter development across core enterprise omnichannel solutions.',
    descriptionId:
        'Memimpin pengembangan Flutter untuk solusi omnichannel tingkat enterprise.',
    highlights: [
      'Jubelio Shipment: Developed e-commerce logistics app enabling pickup/drop-off booking, multi-courier 3PL integrations, and address geocoding.',
      'Jubelio Chat: Multiplatform chat client connected to Shopee, Tokopedia, TikTok Shop, & Lazada, released on Android, iOS, macOS, and Windows.',
      'Jubelio POS: Omnichannel cashier point-of-sale system with Bluetooth thermal printer support, static/dynamic QRIS payments, and offline cash drawer sync.',
    ],
    highlightsId: [
      'Jubelio Shipment: Mengembangkan aplikasi logistik e-commerce dengan integrasi kurir 3PL, booking pickup/drop-off, dan geocoding alamat.',
      'Jubelio Chat: Aplikasi chat multiplatform yang terhubung ke Shopee, Tokopedia, TikTok Shop, & Lazada, dirilis di Android, iOS, macOS, dan Windows.',
      'Jubelio POS: Sistem kasir omnichannel dengan dukungan printer thermal Bluetooth, pembayaran QRIS statis & dinamis, serta sinkronisasi laci kas offline.',
    ],
    technologies: [
      'Flutter',
      'Dart',
      'BLoC/Cubit',
      'Clean Architecture',
      'Bluetooth ESC/POS',
      'QRIS Payment',
      'Desktop Flutter',
      'REST API',
    ],
    appUrl: 'https://play.google.com/store/apps/details?id=com.jubelio.chat',
    isCurrent: true,
  ),
  ExperienceModel(
    id: 'exp_2',
    company: 'Holigo',
    role: 'Flutter Developer',
    roleId: 'Flutter Developer',
    period: 'Aug 2022 - Jan 2023',
    periodId: 'Agustus 2022 - Januari 2023',
    description:
        'Engineered B2B travel and digital products mobile application.',
    descriptionId:
        'Mengembangkan aplikasi mobile B2B travel dan produk digital (PPOB).',
    highlights: [
      'Built end-to-end hotel and flight reservation checkout workflows.',
      'Implemented train ticket booking, PPOB digital bill payments, and e-money top-ups.',
      'Engineered resilient push notifications and real-time transaction updates.',
    ],
    highlightsId: [
      'Membangun alur pemesanan tiket pesawat dan reservasi hotel secara menyeluruh.',
      'Mengimplementasikan pemesanan tiket kereta api, pembayaran tagihan utilitas (PPOB), dan top-up uang elektronik.',
      'Mengintegrasikan notifikasi push yang handal dan pembaruan status transaksi real-time.',
    ],
    technologies: [
      'Flutter',
      'Provider',
      'Dio',
      'Firebase FCM',
      'Payment Gateway',
    ],
    appUrl: 'https://play.google.com/store/apps/details?id=com.droid.sip',
  ),
  ExperienceModel(
    id: 'exp_3',
    company: 'PT FAN Integrasi Teknologi',
    role: 'Flutter Developer & Tech Lead',
    roleId: 'Flutter Developer & Tech Lead',
    period: 'Aug 2021 - Aug 2022',
    periodId: 'Agustus 2021 - Agustus 2022',
    description:
        'Developed enterprise banking and financial institution mobile applications.',
    descriptionId:
        'Mengembangkan aplikasi mobile enterprise perbankan dan institusi finansial.',
    highlights: [
      'JakTeam: Enterprise HRIS mobile app with GPS geofencing & live camera attendance for Bank DKI Jakarta.',
      'ATM Management: Field maintenance & asset monitoring mobile system with Google Maps tracking for Bank Syariah Indonesia (BSI).',
      'Bank BTN Property Advisory: Served as PM & Lead for real estate consultation chat application.',
    ],
    highlightsId: [
      'JakTeam: Aplikasi mobile HRIS enterprise dengan absensi GPS geofencing & verifikasi kamera langsung untuk Bank DKI Jakarta.',
      'ATM Management: Sistem monitoring aset & pemeliharaan mesin ATM berbasis pelacakan Google Maps untuk Bank Syariah Indonesia (BSI).',
      'Bank BTN Property Advisory: Bertindak sebagai PM & Lead untuk aplikasi chat konsultasi properti.',
    ],
    technologies: [
      'Flutter',
      'GetX',
      'Google Maps API',
      'Geofencing',
      'Camera / InAppWebView',
      'SQLite',
    ],
    appUrl:
        'https://play.google.com/store/apps/details?id=id.co.bankdki.jakteam',
  ),
  ExperienceModel(
    id: 'exp_4',
    company: 'Techarea',
    role: 'Android Developer (Intern)',
    roleId: 'Android Developer (Intern)',
    period: 'Aug 2020 - Oct 2020',
    periodId: 'Agustus 2020 - Oktober 2020',
    description:
        'Developed sports venue booking native Android application using Java and Android SDK.',
    descriptionId:
        'Mengembangkan aplikasi Android native untuk reservasi lapangan olahraga menggunakan Java & Android SDK.',
    highlights: [
      'Built custom interactive futsal field schedule grid and booking system.',
      'Integrated RESTful APIs and real-time schedule slot availability.',
    ],
    highlightsId: [
      'Membangun kisi jadwal lapangan interaktif dan sistem reservasi.',
      'Mengintegrasikan API RESTful dengan ketersediaan slot jadwal secara real-time.',
    ],
    technologies: ['Android Native', 'Java', 'XML Layouts', 'REST API'],
  ),
];
