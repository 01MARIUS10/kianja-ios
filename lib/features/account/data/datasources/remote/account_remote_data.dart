import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/features/account/data/models/input/change_password/change_password_input_model.dart';
import 'package:kianja/features/account/data/models/input/update_user_info/update_user_info_input_model.dart';
import 'package:kianja/features/account/data/models/output/kara_history/kara_history_model.dart';

abstract interface class AccountRemoteDataSource {
  Future<void> logout();
  Future<void> changePassword({
    required ChangePasswordInputModel changePasswordInputModel,
  });
  Future<UserModel> updateUserInfo({
    required UpdateUserInfoInputModel updateUserInfoInputModel,
  });
  Future<String> cgu();
  Future<List<KaraHistoryModel>> getAllKaraHistory({required int page});
  Future<int> getKaraCount();
  Future<void> uploadProfilPhoto({required XFile file});
  Future<void> uploadProfilCV({required PlatformFile file});
  Future<void> deleteProfilPhoto();
}
