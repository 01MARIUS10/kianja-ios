import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class EnvConfig {
  static String get appName => dotenv.env['APP_NAME'] ?? '';

  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';

  static String get baseApiUrl => dotenv.env['BASE_API_URL'] ?? '';

  static bool get isDebugLogging =>
      dotenv.env['DEBUG_LOGGING']?.toLowerCase() == 'true';
}
