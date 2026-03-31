import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kianja/core/services/connection_checker.dart';
import 'package:kianja/core/services/dio/dio_client.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_hive_box.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_remote_data.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_user_hive.dart';
import 'package:kianja/core/shared/app_feature/data/repositories/app_repository_impl.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';
import 'package:kianja/core/shared/app_feature/domain/usecases/delete_cached_user_usecase.dart';
import 'package:kianja/core/shared/app_feature/domain/usecases/get_cached_user_usecase.dart';
import 'package:kianja/core/shared/app_feature/domain/usecases/get_user_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initAppDependencies(
  GetIt getIt,
  SharedPreferences sharedPreferences,
  Box<String> appBox,
) async {
  // External
  getIt.registerLazySingleton<Connectivity>(Connectivity.new);

  // Services
  getIt.registerLazySingleton<ConnectionChecker>(
    () => ConnectionCheckerImpl(getIt()),
  );

  // Register ConnectivityBloc as a factory
  getIt.registerFactory<ConnectivityBloc>(
    () => ConnectivityBloc(connectionChecker: getIt()),
  );

  // Register AppSharedPrefs as a singleton
  getIt.registerLazySingleton<AppSharedPrefs>(
    () => AppSharedPrefsImpl(sharedPreferences: sharedPreferences),
  );

  // Generic Hive box (single Box<String> for all Hive objects)
  getIt.registerLazySingleton<AppHiveBox>(() => AppHiveBoxImpl(box: appBox));

  // App User Hive
  getIt.registerLazySingleton<AppUserHive>(
    () => AppUserHiveImpl(hiveBox: getIt<AppHiveBox>()),
  );

  // App DataSources
  getIt.registerLazySingleton<AppRemoteDataSource>(
    () => AppRemoteDataSourceImpl(dio: getIt<DioClient>().getDioInstance()),
  );

  // App Repositories
  getIt.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(remoteDataSource: getIt(), appUserHive: getIt()),
  );

  // App UseCases
  getIt.registerLazySingleton<GetUserUseCase>(
    () => GetUserUseCase(appRepository: getIt()),
  );
  getIt.registerLazySingleton<GetCachedUserUseCase>(
    () => GetCachedUserUseCase(appRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteCachedUserUseCase>(
    () => DeleteCachedUserUseCase(appRepository: getIt()),
  );

  // App Bloc
  getIt.registerFactory<AppBloc>(
    () => AppBloc(
      appSharedPrefs: getIt(),
      getUserUseCase: getIt(),
      getCachedUserUseCase: getIt(),
      deleteCachedUserUseCase: getIt(),
    ),
  );
}
