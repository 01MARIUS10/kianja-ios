import 'package:flutter/material.dart';

abstract final class GlobalKeyService {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final appNavigatorKey = GlobalKey<NavigatorState>();
}
