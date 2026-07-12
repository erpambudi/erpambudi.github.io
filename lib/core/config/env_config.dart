class EnvConfig {
  EnvConfig._();

  static const String appName = String.fromEnvironment(
    'APP_NAME',
    defaultValue: 'App Template',
  );

  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://mamalaundry.erpambudi.my.id/api',
  );

  static const String paymentKey = String.fromEnvironment(
    'PAYMENT_KEY',
    defaultValue: '',
  );

  static const String mapApiKey = String.fromEnvironment(
    'MAP_API_KEY',
    defaultValue: '',
  );
}
