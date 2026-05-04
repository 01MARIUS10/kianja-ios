import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';

class ChangePasswordUseCase implements UseCase<Unit, ChangePasswordParams> {
  const ChangePasswordUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) async {
    return await accountRepository.changePassword(changePasswordParams: params);
  }
}
