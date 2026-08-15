import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kianja/core/di/di_container.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/kianja.dart';

void main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  // Rend les barres système transparentes pour l'affichage bord à bord
  // Applique un style système transparent compatible Android 15
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: Constants.env);
  await Hive.initFlutter();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GetIt.instance<ConnectivityBloc>()
                ..add(const ConnectivitySubscribed()),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<AppBloc>()
            ..add(const AppInitialized())
            ..add(const AppSponsPartnerLoaded()),
        ),
      ],
      child: const Kianja(),
    ),
  );
}
