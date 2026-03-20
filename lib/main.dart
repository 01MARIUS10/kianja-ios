import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kianja/core/di/di_container.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/kianja.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: Constants.env);
  await initDependencies();
  runApp(const Kianja());
}
