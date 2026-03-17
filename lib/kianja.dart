import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/languages.dart';
import 'package:kianja/routing/router.dart';

class Kianja extends StatefulWidget {
  const Kianja({super.key});

  @override
  State<Kianja> createState() => _KianjaState();
}

class _KianjaState extends State<Kianja> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    context.setLocale(Languages.localeFrench);

    return MaterialApp.router(
      title: EnvConfig.appName,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router(),
    );
  }
}
