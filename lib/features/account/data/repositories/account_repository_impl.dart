import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/data/datasources/remote/account_remote_data.dart';
import 'package:kianja/features/account/data/models/input/change_password/change_password_input_model.dart';
import 'package:kianja/features/account/data/models/input/update_user_info/update_user_info_input_model.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
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
  Future<Either<Failure, String>> cgu() async {
    try {
      final cgu = await remoteDataSource.cgu();
      return right(cgu);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
