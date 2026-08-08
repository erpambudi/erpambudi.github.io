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
  /// **'App Template'**
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
