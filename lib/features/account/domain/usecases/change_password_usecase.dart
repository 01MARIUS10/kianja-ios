import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class ChangePasswordUseCase implements UseCase<Unit, ChangePasswordParams> {
  const ChangePasswordUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(ChangePasswordParams params) async {
    return await accountRepository.changePassword(
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
    );
  }
}

class ChangePasswordParams {
  const ChangePasswordParams({
    required this.oldPassword,
    required this.newPassword,
  });

  final String oldPassword;
  final String newPassword;
}
