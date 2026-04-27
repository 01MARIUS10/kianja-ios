import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:kianja/core/services/dio/dio_client.dart';
import 'package:kianja/core/shared/app_feature/app_di.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/account_di.dart';
import 'package:kianja/features/auth/auth_di.dart';
import 'package:kianja/features/jobs/jobs_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  // External — initialize and register as singleton
  final sharedPreferences = await SharedPreferences.getInstance();
  final appBox = await Hive.openBox<String>(Constants.appBox);
  await initAppDependencies(getIt, sharedPreferences, appBox);

  // Services
  getIt.registerLazySingleton<DioClient>(
    () => DioClient(appSharedPrefs: getIt()),
  );

  // Dio client instance
  final dioClient = getIt<DioClient>().getDioInstance();

  // Auth
  await initAuthDependencies(getIt, dioClient);

  // Account
  await initAccountDependencies(getIt, dioClient);

  // Jobs
  await initJobsDependencies(getIt, dioClient);
}
