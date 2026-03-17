import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class EnvConfig {
  static String get appName => dotenv.env['APP_NAME'] ?? 'KIANJA';

  static String get baseUrl => dotenv.env['BASE_URL'] ?? 'https://kianja.mg/';

  static bool get isDebugLogging =>
      dotenv.env['DEBUG_LOGGING']?.toLowerCase() == 'true';
}
