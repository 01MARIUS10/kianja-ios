import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // // Data sources
  // getIt.registerLazySingleton<AuthLocalDataSource>(
  //   () => AuthLocalDataSourceImpl(getIt()),
  // );

  // // Repositories
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(localDataSource: getIt()),
  // );

  // // Blocs
  // getIt.registerFactory(() => AuthBloc(repository: getIt()));
}
