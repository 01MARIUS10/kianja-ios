import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/data/app_shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initSharedDependencies(
  GetIt getIt,
  SharedPreferences sharedPreferences,
) async {
  // Register AppSharedPrefs as a singleton
  getIt.registerSingleton<AppSharedPrefs>(
    AppSharedPrefsImpl(sharedPreferences: sharedPreferences),
  );

  // Register AppBloc as a factory (new instance each time)
  getIt.registerFactory<AppBloc>(() => AppBloc(appSharedPrefs: getIt()));
}
