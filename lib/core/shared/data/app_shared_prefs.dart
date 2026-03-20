import 'package:shared_preferences/shared_preferences.dart';

/// Service to handle local data persistence using [SharedPreferences].
abstract class AppSharedPrefs {
  Future<void> save(String key, dynamic value);
  T? get<T>(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

class AppSharedPrefsImpl implements AppSharedPrefs {
  const AppSharedPrefsImpl({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<void> save(String key, dynamic value) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      await sharedPreferences.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  }

  @override
  T? get<T>(String key) {
    return sharedPreferences.get(key) as T?;
  }

  @override
  Future<void> remove(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }
}
