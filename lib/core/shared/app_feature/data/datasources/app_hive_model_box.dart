import 'package:kianja/core/shared/app_feature/data/datasources/app_hive_box.dart';

// ---------------------------------------------------------------------------
// HiveModelAdapter — the bridge between a Dart model and raw JSON.
// ---------------------------------------------------------------------------

/// Describes how to convert a model [T] to and from a JSON map.
///
/// Implement this once per model and pass it to [AppHiveModelBox].
///
/// Example:
/// ```dart
/// class UserModelAdapter implements HiveModelAdapter<UserModel> {
///   const UserModelAdapter();
///
///   @override
///   UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);
///
///   @override
///   Map<String, dynamic> toJson(UserModel model) => model.toJson();
/// }
/// ```
abstract interface class HiveModelAdapter<T> {
  /// Deserializes a JSON map into a model instance.
  T fromJson(Map<String, dynamic> json);

  /// Serializes a model instance into a JSON map.
  Map<String, dynamic> toJson(T model);
}

// ---------------------------------------------------------------------------
// AppHiveModelBox<T> — strongly-typed box backed by AppHiveBox.
// ---------------------------------------------------------------------------

/// A strongly-typed, key-value Hive store for any JSON-serializable model [T].
///
/// Works like a Hive [TypeAdapter] but with **zero code generation** — just
/// implement [HiveModelAdapter<T>] and you're done.
///
/// Usage:
/// ```dart
/// // 1. Define an adapter (once per model):
/// class UserAdapter implements HiveModelAdapter<UserModel> {
///   const UserAdapter();
///   @override UserModel fromJson(Map<String, dynamic> j) => UserModel.fromJson(j);
///   @override Map<String, dynamic> toJson(UserModel m) => m.toJson();
/// }
///
/// // 2. Create the typed box (injected via DI):
/// final userBox = AppHiveModelBox<UserModel>(
///   hiveBox: getIt<AppHiveBox>(),
///   adapter: const UserAdapter(),
/// );
///
/// // 3. Use it:
/// await userBox.save('me', user);
/// final cached = userBox.get('me');   // UserModel?
/// await userBox.delete('me');
/// ```
abstract class AppHiveModelBox<T> {
  /// Persists [model] under [key].
  Future<void> save(String key, T model);

  /// Returns the model stored under [key], or `null` if absent.
  T? get(String key);

  /// Deletes the entry for [key].
  Future<void> delete(String key);

  /// Wipes every entry in the box.
  Future<void> clear();
}

/// Concrete implementation of [AppHiveModelBox].
///
/// Delegates raw storage to [AppHiveBox] and delegates
/// serialization to the provided [HiveModelAdapter].
class AppHiveModelBoxImpl<T> implements AppHiveModelBox<T> {
  const AppHiveModelBoxImpl({
    required this.hiveBox,
    required this.adapter,
  });

  /// The raw JSON-string box shared across the app.
  final AppHiveBox hiveBox;

  /// The codec that converts [T] ↔ `Map<String, dynamic>`.
  final HiveModelAdapter<T> adapter;

  @override
  Future<void> save(String key, T model) async {
    await hiveBox.save(key, adapter.toJson(model));
  }

  @override
  T? get(String key) {
    final json = hiveBox.get(key);
    if (json == null) return null;
    return adapter.fromJson(json);
  }

  @override
  Future<void> delete(String key) async {
    await hiveBox.remove(key);
  }

  @override
  Future<void> clear() async {
    await hiveBox.clear();
  }
}
