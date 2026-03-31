import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/l10n/app_localizations.dart';
import 'package:kianja/core/l10n/mg_localizations.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/themes/app_theme.dart';
import 'package:kianja/core/utils/global_key_service.dart';
import 'package:kianja/routing/router.dart';

class Kianja extends StatefulWidget {
  const Kianja({super.key});

  @override
  State<Kianja> createState() => _KianjaState();
}

class _KianjaState extends State<Kianja> {
  static const List<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    MalagasyMaterialLocalizationsDelegate(),
    MalagasyCupertinoLocalizationsDelegate(),
  ];
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter.buildRouter(BlocProvider.of<AppBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {
        if (state.appInitStatus == AppInitStatus.loaded) {
          FlutterNativeSplash.remove();
        }
      },
      builder: (context, state) {
        return MaterialApp.router(
          title: EnvConfig.appName,
          scaffoldMessengerKey: GlobalKeyService.scaffoldMessengerKey,
          localizationsDelegates: _localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.lang,
          themeMode: state.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          routerConfig: _router,
        );
      },
    );
  }
}
