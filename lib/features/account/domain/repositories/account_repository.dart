import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';

abstract interface class AccountRepository {
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> deleteProfilPhoto();
  Future<Either<Failure, Unit>> uploadProfilPhoto({required XFile file});

  Future<Either<Failure, Unit>> changePassword({
    required ChangePasswordParams changePasswordParams,
  });
  Future<Either<Failure, User>> updateProfile({
    required UpdateUserInfoParams updateUserInfoParams,
  });
  Future<Either<Failure, String>> cgu();
  Future<Either<Failure, List<KaraHistory>>> getAllKaraHistory({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, int>> getKaraCount();
}
