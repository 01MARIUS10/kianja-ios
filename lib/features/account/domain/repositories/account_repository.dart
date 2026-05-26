import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';

abstract interface class AccountRepository {
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> changePassword({
    required ChangePasswordParams changePasswordParams,
  });
  Future<Either<Failure, User>> updateProfile({
    required UpdateUserInfoParams updateUserInfoParams,
  });
  Future<Either<Failure, String>> cgu();
}
