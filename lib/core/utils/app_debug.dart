import 'package:flutter/foundation.dart';

abstract class AppDebug {
  static void showPrint(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}
