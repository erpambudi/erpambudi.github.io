import '../models/experience_model.dart';

const kExperienceData = [
  ExperienceModel(
    id: 'exp_1',
    company: 'PT Guardia Teknologi Indonesia (Jubelio)',
    role: 'Senior Flutter Developer',
    period: 'Maret 2023 - Sekarang',
    description:
        'Leading Flutter development across core enterprise omnichannel solutions.',
    highlights: [
      'Jubelio Shipment: Developed e-commerce logistics app enabling pickup/drop-off booking, multi-courier 3PL integrations, and address geocoding.',
      'Jubelio Chat: Multiplatform chat client connected to Shopee, Tokopedia, TikTok Shop, & Lazada, released on Android, iOS, macOS, and Windows.',
      'Jubelio POS: Omnichannel cashier point-of-sale system with Bluetooth thermal printer support, static/dynamic QRIS payments, and offline cash drawer sync.',
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
    period: 'Agustus 2022 - Januari 2023',
    description:
        'Engineered B2B travel and digital products mobile application.',
    highlights: [
      'Built end-to-end hotel and flight reservation checkout workflows.',
      'Implemented train ticket booking, PPOB digital bill payments, and e-money top-ups.',
      'Engineered resilient push notifications and real-time transaction updates.',
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
    period: 'Agustus 2021 - Agustus 2022',
    description:
        'Developed enterprise banking and financial institution mobile applications.',
    highlights: [
      'JakTeam: Enterprise HRIS mobile app with GPS geofencing & live camera attendance for Bank DKI Jakarta.',
      'ATM Management: Field maintenance & asset monitoring mobile system with Google Maps tracking for Bank Syariah Indonesia (BSI).',
      'Bank BTN Property Advisory: Served as PM & Lead for real estate consultation chat application.',
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
    period: 'Agustus 2020 - Oktober 2020',
    description:
        'Developed sports venue booking native Android application using Java and Android SDK.',
    highlights: [
      'Built custom interactive futsal field schedule grid and booking system.',
      'Integrated RESTful APIs and real-time schedule slot availability.',
    ],
    technologies: ['Android Native', 'Java', 'XML Layouts', 'REST API'],
  ),
];
