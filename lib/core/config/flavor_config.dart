import 'env_config.dart';

enum Flavor { development, production }

class FlavorConfig {
  FlavorConfig._();

  static Flavor _flavor = Flavor.production;

  static Flavor get flavor => _flavor;
  static bool get isDevelopment => _flavor == Flavor.development;
  static bool get isProduction => _flavor == Flavor.production;

  static void initialize(Flavor flavor) {
    _flavor = flavor;
  }

  static String get appName => EnvConfig.appName;
  static String get baseUrl => EnvConfig.baseUrl;
}
