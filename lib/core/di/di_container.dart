import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/di/shared_di.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Global service locator instance.
final GetIt getIt = GetIt.instance;

Future<void> initDependencies() async {
  // External — initialize and register as singleton
  final sharedPreferences = await SharedPreferences.getInstance();
  await initSharedDependencies(getIt, sharedPreferences);
}
