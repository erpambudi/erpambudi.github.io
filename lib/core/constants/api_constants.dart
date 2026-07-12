import 'package:mobile_template/core/config/flavor_config.dart';

class ApiConstants {
  ApiConstants._();

  static String get baseUrl => FlavorConfig.baseUrl;

  // Auth
  static const String login = '/auth/login';
  static const String me = '/auth/me';

  // Orders
  static const String orders = '/orders';
  static String orderById(int id) => '/orders/$id';
}
