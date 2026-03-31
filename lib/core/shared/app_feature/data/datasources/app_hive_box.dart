import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

/// A generic Hive box that persists any JSON-serializable object
/// using a single [Box<String>].
///
/// Works identically to [AppSharedPrefs] but backed by Hive, making
/// it suitable for complex objects that [SharedPreferences] cannot store.
///
/// Usage example:
/// ```dart
/// final box = AppHiveBoxImpl(box: await Hive.openBox<String>('app_box'));
/// await box.save('user', user.toJson());
/// final json = box.get('user');
/// final user = json != null ? UserModel.fromJson(json) : null;
/// ```
abstract class AppHiveBox {
  /// Saves a JSON map under [key].
  Future<void> save(String key, Map<String, dynamic> value);

  /// Returns the decoded JSON map for [key], or `null` if not found.
  Map<String, dynamic>? get(String key);

  /// Removes a single entry by [key].
  Future<void> remove(String key);

  /// Clears the entire box.
  Future<void> clear();
}

class AppHiveBoxImpl implements AppHiveBox {
  const AppHiveBoxImpl({required this.box});

  /// The underlying single Hive box. Stores values as raw JSON strings.
  final Box<String> box;

  @override
  Future<void> save(String key, Map<String, dynamic> value) async {
    await box.put(key, jsonEncode(value));
  }

  @override
  Map<String, dynamic>? get(String key) {
    final raw = box.get(key);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  @override
  Future<void> remove(String key) async {
    await box.delete(key);
  }

  @override
  Future<void> clear() async {
    await box.clear();
  }
}
