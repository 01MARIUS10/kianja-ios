import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/languages.dart';
import 'package:kianja/kianja.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: '.env');
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: Languages.localeLanguages,
      path: Assets.translationsPath,
      fallbackLocale: Languages.localeFrench,
      child: const Kianja(),
    ),
  );
}
