import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kianja/config/assets.dart';
import 'package:kianja/core/constants/constants.dart';
import 'package:kianja/core/themes/languages.dart';
import 'package:kianja/routing/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class Kianja extends StatelessWidget {
  const Kianja({super.key});

  @override
  Widget build(BuildContext context) {
    context.setLocale(Languages.localeFrench);

    return MaterialApp.router(
      title: Constants.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router(),
    );
  }
}
