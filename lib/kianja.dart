import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/l10n/app_localizations.dart';
import 'package:kianja/core/shared/bloc/app/app_bloc.dart';
import 'package:kianja/core/themes/app_theme.dart';
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
    return BlocProvider(
      create: (context) =>
          GetIt.instance<AppBloc>()..add(const AppInitialized()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: EnvConfig.appName,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.lang,
            themeMode: ThemeMode.system,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            routerConfig: router(),
          );
        },
      ),
    );
  }
}
