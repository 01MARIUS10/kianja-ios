import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class GetKaraUseCase implements UseCase<int, NoParams> {
  const GetKaraUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await accountRepository.getKaraCount();
  }
}
