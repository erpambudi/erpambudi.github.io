import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In id, this message translates to:
  /// **'Rizki Pambudi | Senior Mobile & Flutter Developer'**
  String get appTitle;

  /// No description provided for @login.
  ///
  /// In id, this message translates to:
  /// **'Masuk'**
  String get login;

  /// No description provided for @email.
  ///
  /// In id, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In id, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @dashboard.
  ///
  /// In id, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @orders.
  ///
  /// In id, this message translates to:
  /// **'Pesanan'**
  String get orders;

  /// No description provided for @profile.
  ///
  /// In id, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @totalOrder.
  ///
  /// In id, this message translates to:
  /// **'Total Order'**
  String get totalOrder;

  /// No description provided for @inProgress.
  ///
  /// In id, this message translates to:
  /// **'Dalam Proses'**
  String get inProgress;

  /// No description provided for @completed.
  ///
  /// In id, this message translates to:
  /// **'Selesai'**
  String get completed;

  /// No description provided for @revenue.
  ///
  /// In id, this message translates to:
  /// **'Pendapatan'**
  String get revenue;

  /// No description provided for @newCustomerRegistered.
  ///
  /// In id, this message translates to:
  /// **'Pelanggan baru terdaftar'**
  String get newCustomerRegistered;

  /// No description provided for @twoMinutesAgo.
  ///
  /// In id, this message translates to:
  /// **'2 menit yang lalu'**
  String get twoMinutesAgo;

  /// No description provided for @fifteenMinutesAgo.
  ///
  /// In id, this message translates to:
  /// **'15 menit yang lalu'**
  String get fifteenMinutesAgo;

  /// No description provided for @oneHourAgo.
  ///
  /// In id, this message translates to:
  /// **'1 jam yang lalu'**
  String get oneHourAgo;

  /// No description provided for @twoHoursAgo.
  ///
  /// In id, this message translates to:
  /// **'2 jam yang lalu'**
  String get twoHoursAgo;

  /// No description provided for @threeHoursAgo.
  ///
  /// In id, this message translates to:
  /// **'3 jam yang lalu'**
  String get threeHoursAgo;

  /// No description provided for @recentActivity.
  ///
  /// In id, this message translates to:
  /// **'Aktivitas Terbaru'**
  String get recentActivity;

  /// No description provided for @orderList.
  ///
  /// In id, this message translates to:
  /// **'Daftar Pesanan'**
  String get orderList;

  /// No description provided for @all.
  ///
  /// In id, this message translates to:
  /// **'Semua'**
  String get all;

  /// No description provided for @received.
  ///
  /// In id, this message translates to:
  /// **'Diterima'**
  String get received;

  /// No description provided for @washing.
  ///
  /// In id, this message translates to:
  /// **'Sedang Dicuci'**
  String get washing;

  /// No description provided for @drying.
  ///
  /// In id, this message translates to:
  /// **'Sedang Dikeringkan'**
  String get drying;

  /// No description provided for @ironing.
  ///
  /// In id, this message translates to:
  /// **'Sedang Disetrika'**
  String get ironing;

  /// No description provided for @taken.
  ///
  /// In id, this message translates to:
  /// **'Sudah Diambil'**
  String get taken;

  /// No description provided for @totalPrice.
  ///
  /// In id, this message translates to:
  /// **'Total Harga'**
  String get totalPrice;

  /// No description provided for @phone.
  ///
  /// In id, this message translates to:
  /// **'Telepon'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In id, this message translates to:
  /// **'Alamat'**
  String get address;

  /// No description provided for @joined.
  ///
  /// In id, this message translates to:
  /// **'Bergabung'**
  String get joined;

  /// No description provided for @editProfile.
  ///
  /// In id, this message translates to:
  /// **'Edit Profil'**
  String get editProfile;

  /// No description provided for @changePassword.
  ///
  /// In id, this message translates to:
  /// **'Ubah Password'**
  String get changePassword;

  /// No description provided for @notifications.
  ///
  /// In id, this message translates to:
  /// **'Notifikasi'**
  String get notifications;

  /// No description provided for @help.
  ///
  /// In id, this message translates to:
  /// **'Bantuan'**
  String get help;

  /// No description provided for @logout.
  ///
  /// In id, this message translates to:
  /// **'Keluar'**
  String get logout;

  /// No description provided for @confirmLogoutTitle.
  ///
  /// In id, this message translates to:
  /// **'Konfirmasi Logout'**
  String get confirmLogoutTitle;

  /// No description provided for @confirmLogoutContent.
  ///
  /// In id, this message translates to:
  /// **'Apakah Anda yakin ingin keluar?'**
  String get confirmLogoutContent;

  /// No description provided for @cancel.
  ///
  /// In id, this message translates to:
  /// **'Batal'**
  String get cancel;

  /// No description provided for @errorOccurred.
  ///
  /// In id, this message translates to:
  /// **'Terjadi Kesalahan'**
  String get errorOccurred;

  /// No description provided for @emptyData.
  ///
  /// In id, this message translates to:
  /// **'Data Kosong'**
  String get emptyData;

  /// No description provided for @language.
  ///
  /// In id, this message translates to:
  /// **'Bahasa'**
  String get language;

  /// No description provided for @portfolioTitle.
  ///
  /// In id, this message translates to:
  /// **'Rizki Pambudi | Senior Mobile Developer'**
  String get portfolioTitle;

  /// No description provided for @heroGreeting.
  ///
  /// In id, this message translates to:
  /// **'Halo, Saya'**
  String get heroGreeting;

  /// No description provided for @heroName.
  ///
  /// In id, this message translates to:
  /// **'Rizki Pambudi'**
  String get heroName;

  /// No description provided for @heroRole.
  ///
  /// In id, this message translates to:
  /// **'Senior Flutter & Mobile Developer'**
  String get heroRole;

  /// No description provided for @heroTagline.
  ///
  /// In id, this message translates to:
  /// **'Membangun aplikasi mobile & multiplatform berkinerja tinggi, elegan, dan scalable dengan Clean Architecture.'**
  String get heroTagline;

  /// No description provided for @availableForWork.
  ///
  /// In id, this message translates to:
  /// **'Terbuka untuk Peluang Kerja & Proyek Berdampak Tinggi'**
  String get availableForWork;

  /// No description provided for @downloadCv.
  ///
  /// In id, this message translates to:
  /// **'Unduh CV'**
  String get downloadCv;

  /// No description provided for @contactMe.
  ///
  /// In id, this message translates to:
  /// **'Hubungi Saya'**
  String get contactMe;

  /// No description provided for @exploreProjects.
  ///
  /// In id, this message translates to:
  /// **'Lihat Proyek'**
  String get exploreProjects;

  /// No description provided for @yearsExperience.
  ///
  /// In id, this message translates to:
  /// **'Tahun Pengalaman'**
  String get yearsExperience;

  /// No description provided for @appsShipped.
  ///
  /// In id, this message translates to:
  /// **'Aplikasi Produksi'**
  String get appsShipped;

  /// No description provided for @happyUsers.
  ///
  /// In id, this message translates to:
  /// **'Pengguna Terdampak'**
  String get happyUsers;

  /// No description provided for @certifiedSkills.
  ///
  /// In id, this message translates to:
  /// **'Sertifikasi Resmi'**
  String get certifiedSkills;

  /// No description provided for @navHome.
  ///
  /// In id, this message translates to:
  /// **'Beranda'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In id, this message translates to:
  /// **'Tentang'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In id, this message translates to:
  /// **'Keahlian'**
  String get navSkills;

  /// No description provided for @navExperience.
  ///
  /// In id, this message translates to:
  /// **'Pengalaman'**
  String get navExperience;

  /// No description provided for @navProjects.
  ///
  /// In id, this message translates to:
  /// **'Proyek'**
  String get navProjects;

  /// No description provided for @navCertificates.
  ///
  /// In id, this message translates to:
  /// **'Sertifikasi'**
  String get navCertificates;

  /// No description provided for @navContact.
  ///
  /// In id, this message translates to:
  /// **'Kontak'**
  String get navContact;

  /// No description provided for @aboutTitle.
  ///
  /// In id, this message translates to:
  /// **'Tentang Saya'**
  String get aboutTitle;

  /// No description provided for @aboutSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Software Engineer berpengalaman dengan spesialisasi ekosistem Mobile & Multiplatform'**
  String get aboutSubtitle;

  /// No description provided for @aboutBio.
  ///
  /// In id, this message translates to:
  /// **'Saya seorang Mobile Developer dengan 5+ tahun pengalaman nyata dalam merancang dan mengembangkan aplikasi Android, iOS, Windows, dan macOS yang handal. Sangat menguasai Flutter dan Dart, dengan pemahaman mendalam tentang Clean Architecture, prinsip SOLID, state management BLoC/Cubit, arsitektur offline-first (Hive/SQLite), integrasi perangkat keras (printer thermal Bluetooth POS, QRIS dinamis, geofencing GPS), dan otomatisasi CI/CD. Berkomitmen menghadirkan pengalaman UI/UX kelas dunia serta kode yang modular, bersih, dan mudah diuji.'**
  String get aboutBio;

  /// No description provided for @location.
  ///
  /// In id, this message translates to:
  /// **'Lokasi'**
  String get location;

  /// No description provided for @locationValue.
  ///
  /// In id, this message translates to:
  /// **'Jakarta, Indonesia'**
  String get locationValue;

  /// No description provided for @emailLabel.
  ///
  /// In id, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In id, this message translates to:
  /// **'WhatsApp / Telepon'**
  String get phoneLabel;

  /// No description provided for @skillsTitle.
  ///
  /// In id, this message translates to:
  /// **'Keahlian & Stack Teknologi'**
  String get skillsTitle;

  /// No description provided for @skillsSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Teknologi, tools, dan arsitektur yang saya gunakan setiap hari'**
  String get skillsSubtitle;

  /// No description provided for @categoryLanguages.
  ///
  /// In id, this message translates to:
  /// **'Bahasa Pemrograman'**
  String get categoryLanguages;

  /// No description provided for @categoryFrameworks.
  ///
  /// In id, this message translates to:
  /// **'Framework & State Management'**
  String get categoryFrameworks;

  /// No description provided for @categoryArchitecture.
  ///
  /// In id, this message translates to:
  /// **'Arsitektur & Clean Code'**
  String get categoryArchitecture;

  /// No description provided for @categoryDatabase.
  ///
  /// In id, this message translates to:
  /// **'Database & Penyimpanan Lokal'**
  String get categoryDatabase;

  /// No description provided for @categoryCloud.
  ///
  /// In id, this message translates to:
  /// **'Cloud, API & Backend'**
  String get categoryCloud;

  /// No description provided for @categoryHardware.
  ///
  /// In id, this message translates to:
  /// **'Integrasi Hardware & Native'**
  String get categoryHardware;

  /// No description provided for @categoryTools.
  ///
  /// In id, this message translates to:
  /// **'DevOps & Tools'**
  String get categoryTools;

  /// No description provided for @experienceTitle.
  ///
  /// In id, this message translates to:
  /// **'Pengalaman Kerja'**
  String get experienceTitle;

  /// No description provided for @experienceSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Perjalanan profesional dalam membangun aplikasi berskala enterprise'**
  String get experienceSubtitle;

  /// No description provided for @present.
  ///
  /// In id, this message translates to:
  /// **'Sekarang'**
  String get present;

  /// No description provided for @viewAppStore.
  ///
  /// In id, this message translates to:
  /// **'Buka Aplikasi Live'**
  String get viewAppStore;

  /// No description provided for @keyAchievements.
  ///
  /// In id, this message translates to:
  /// **'Kontribusi & Pencapaian Utama:'**
  String get keyAchievements;

  /// No description provided for @projectsTitle.
  ///
  /// In id, this message translates to:
  /// **'Proyek Unggulan'**
  String get projectsTitle;

  /// No description provided for @projectsSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Koleksi aplikasi produksi yang dirilis di berbagai platform mobile & desktop'**
  String get projectsSubtitle;

  /// No description provided for @filterAll.
  ///
  /// In id, this message translates to:
  /// **'Semua Proyek'**
  String get filterAll;

  /// No description provided for @filterMobile.
  ///
  /// In id, this message translates to:
  /// **'Mobile (Android & iOS)'**
  String get filterMobile;

  /// No description provided for @filterDesktop.
  ///
  /// In id, this message translates to:
  /// **'Desktop (macOS & Windows)'**
  String get filterDesktop;

  /// No description provided for @viewDetails.
  ///
  /// In id, this message translates to:
  /// **'Lihat Detail'**
  String get viewDetails;

  /// No description provided for @liveStore.
  ///
  /// In id, this message translates to:
  /// **'Aplikasi Live'**
  String get liveStore;

  /// No description provided for @platforms.
  ///
  /// In id, this message translates to:
  /// **'Platform'**
  String get platforms;

  /// No description provided for @techStack.
  ///
  /// In id, this message translates to:
  /// **'Teknologi'**
  String get techStack;

  /// No description provided for @certificatesTitle.
  ///
  /// In id, this message translates to:
  /// **'Sertifikasi & Lisensi Resmi'**
  String get certificatesTitle;

  /// No description provided for @certificatesSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Kredensial profesional terverifikasi, predikat expert, dan lisensi kompetensi'**
  String get certificatesSubtitle;

  /// No description provided for @verifyCredential.
  ///
  /// In id, this message translates to:
  /// **'Lihat Sertifikat'**
  String get verifyCredential;

  /// No description provided for @credentialId.
  ///
  /// In id, this message translates to:
  /// **'ID Kredensial'**
  String get credentialId;

  /// No description provided for @issuedBy.
  ///
  /// In id, this message translates to:
  /// **'Penerbit'**
  String get issuedBy;

  /// No description provided for @contactTitle.
  ///
  /// In id, this message translates to:
  /// **'Mari Terhubung & Berkolaborasi'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In id, this message translates to:
  /// **'Tertarik mendiskusikan peluang kerja atau proyek baru? Mari berbincang!'**
  String get contactSubtitle;

  /// No description provided for @sendMessage.
  ///
  /// In id, this message translates to:
  /// **'Kirim Pesan'**
  String get sendMessage;

  /// No description provided for @name.
  ///
  /// In id, this message translates to:
  /// **'Nama Lengkap'**
  String get name;

  /// No description provided for @subject.
  ///
  /// In id, this message translates to:
  /// **'Subjek'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In id, this message translates to:
  /// **'Pesan'**
  String get message;

  /// No description provided for @messageSentSuccess.
  ///
  /// In id, this message translates to:
  /// **'Terima kasih! Membuka aplikasi email Anda...'**
  String get messageSentSuccess;

  /// No description provided for @quickWhatsApp.
  ///
  /// In id, this message translates to:
  /// **'Chat Langsung di WhatsApp'**
  String get quickWhatsApp;

  /// No description provided for @scheduleCall.
  ///
  /// In id, this message translates to:
  /// **'Jadwalkan Diskusi'**
  String get scheduleCall;

  /// No description provided for @copyright.
  ///
  /// In id, this message translates to:
  /// **'© 2026 Rizki Pambudi. Dibuat dengan Flutter Web & Clean Architecture.'**
  String get copyright;

  /// No description provided for @lightMode.
  ///
  /// In id, this message translates to:
  /// **'Mode Terang'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In id, this message translates to:
  /// **'Mode Gelap'**
  String get darkMode;

  /// No description provided for @toggleTheme.
  ///
  /// In id, this message translates to:
  /// **'Ganti Tema'**
  String get toggleTheme;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
