import 'dart:io';

import 'package:flutter/foundation.dart';

class CheckPlatform {
  static bool get isWeb => kIsWeb;

  // Using defaultTargetPlatform is safe on web, but it tells you the OS the browser is running on.
  // If you only want to know if the app is running natively on a platform, check !kIsWeb first.
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isFuchsia => !kIsWeb && Platform.isFuchsia;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isLinux => !kIsWeb && Platform.isLinux;
  static bool get isWindows => !kIsWeb && Platform.isWindows;

  static TargetPlatform get currentPlatform => defaultTargetPlatform;
  static List<TargetPlatform> get values => TargetPlatform.values;
}
