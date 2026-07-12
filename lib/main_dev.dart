import 'package:flutter/material.dart';
import 'app.dart';
import 'core/config/flavor_config.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig.initialize(Flavor.development);

  await di.init();

  runApp(const MyApp());
}
