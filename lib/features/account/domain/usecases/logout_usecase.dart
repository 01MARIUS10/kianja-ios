import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class LogoutUseCase implements UseCase<Unit, NoParams> {
  const LogoutUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await accountRepository.logout();
  }
}
