import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kianja/config/assets.dart';
import 'package:kianja/core/constants/constants.dart';
import 'package:kianja/core/themes/languages.dart';

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

    return MaterialApp(
      title: Constants.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Home(title: Constants.appName),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [Text(context.tr('hello'))],
        ),
      ),
    );
  }
}
