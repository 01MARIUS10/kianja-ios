import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_params.dart';

class UnblockUserUseCase implements UseCase<Unit, UnblockUserParams> {
  const UnblockUserUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(UnblockUserParams params) async {
    return await accountRepository.unblockUser(unblockUserParams: params);
  }
}
