import 'package:flutter/foundation.dart';

/// Notifies jobs tab screens to reset their local state to initial values.
class JobsTabResetNotifier extends ChangeNotifier {
  void reset() {
    notifyListeners();
  }
}
