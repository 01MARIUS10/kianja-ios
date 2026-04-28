import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';

class UpdateUserInfoUseCase implements UseCase<User, UpdateUserInfoParams> {
  const UpdateUserInfoUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, User>> call(UpdateUserInfoParams params) async {
    return await accountRepository.updateProfile(updateUserInfoParams: params);
  }
}
