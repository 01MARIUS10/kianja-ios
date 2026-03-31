import 'package:kianja/core/shared/app_feature/data/datasources/app_hive_box.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';

/// Keys used to persist user data in Hive.
abstract final class _UserHiveKeys {
  static const String user = 'current_user';
}

/// Local Hive data-source for the authenticated user.
///
/// Stores the [UserModel] as a JSON string inside the shared [AppHiveBox],
/// so no Hive [TypeAdapter] registration is needed.
abstract class AppUserHive {
  /// Persists [user] locally.
  Future<void> saveUser(UserModel user);

  /// Returns the cached [UserModel], or `null` if none is stored.
  UserModel? getUser();

  /// Removes the cached user.
  Future<void> deleteUser();
}

class AppUserHiveImpl implements AppUserHive {
  const AppUserHiveImpl({required this.hiveBox});

  final AppHiveBox hiveBox;

  @override
  Future<void> saveUser(UserModel user) async {
    await hiveBox.save(_UserHiveKeys.user, user.toJson());
  }

  @override
  UserModel? getUser() {
    final json = hiveBox.get(_UserHiveKeys.user);
    if (json == null) return null;
    return UserModel.fromJson(json);
  }

  @override
  Future<void> deleteUser() async {
    await hiveBox.remove(_UserHiveKeys.user);
  }
}
