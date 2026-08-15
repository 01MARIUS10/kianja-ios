import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/data/datasources/remote/account_remote_data.dart';
import 'package:kianja/features/account/data/models/input/change_password/change_password_input_model.dart';
import 'package:kianja/features/account/data/models/input/send_complaints_suggestions/send_complaints_suggestions_input_model.dart';
import 'package:kianja/features/account/data/models/input/update_user_info/update_user_info_input_model.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/complaints_suggestions/complaints_suggestions_params.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';

class AccountRepositoryImpl implements AccountRepository {
  const AccountRepositoryImpl({
    required this.remoteDataSource,
    required this.appSharedPrefs,
  });
  final AccountRemoteDataSource remoteDataSource;
  final AppSharedPrefs appSharedPrefs;

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      await appSharedPrefs.remove(Constants.token);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadProfilPhoto({required XFile file}) async {
    try {
      await remoteDataSource.uploadProfilPhoto(file: file);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadProfilCV({
    required PlatformFile file,
  }) async {
    try {
      await remoteDataSource.uploadProfilCV(file: file);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProfilPhoto() async {
    try {
      await remoteDataSource.deleteProfilPhoto();
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required ChangePasswordParams changePasswordParams,
  }) async {
    try {
      await remoteDataSource.changePassword(
        changePasswordInputModel: ChangePasswordInputModel(
          oldPassword: changePasswordParams.oldPassword,
          newPassword: changePasswordParams.newPassword,
        ),
      );
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile({
    required UpdateUserInfoParams updateUserInfoParams,
  }) async {
    try {
      final user = await remoteDataSource.updateUserInfo(
        updateUserInfoInputModel: UpdateUserInfoInputModel(
          firstName: updateUserInfoParams.firstName,
          lastName: updateUserInfoParams.lastName,
          email: updateUserInfoParams.email,
          photo: updateUserInfoParams.photo,
          pseudo: 'pseudo',
          residence: updateUserInfoParams.residence,
        ),
      );
      return right(user);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendComplaintsSuggestions({
    required ComplaintsSuggestionsParams complaintsSuggestionsParams,
  }) async {
    try {
      await remoteDataSource.sendComplaintsSuggestions(
        sendComplaintsSuggestionsInputModel:
            SendComplaintsSuggestionsInputModel(
              title: complaintsSuggestionsParams.title,
              description: complaintsSuggestionsParams.description,
              imageIds: complaintsSuggestionsParams.imageIds,
            ),
      );
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, String>> cgu() async {
    try {
      final cgu = await remoteDataSource.cgu();
      return right(cgu);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, String>> privacy() async {
    try {
      final privacy = await remoteDataSource.privacy();
      return right(privacy);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<KaraHistory>>> getAllKaraHistory({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final result = await remoteDataSource.getAllKaraHistory(
        page: queryPageParams.page,
      );
      return right(result);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, int>> getKaraCount() async {
    try {
      final kara = await remoteDataSource.getKaraCount();
      return right(kara);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getBlockedUsers({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final result = await remoteDataSource.getBlockedUsers(
        page: queryPageParams.page,
      );
      return right(result);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> unblockUser({
    required UnblockUserParams unblockUserParams,
  }) async {
    try {
      await remoteDataSource.unblockUser(id: unblockUserParams.id);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
