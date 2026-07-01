import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class GetAllKaraHistoryUsecase
    implements UseCase<List<KaraHistory>, QueryPageParams> {
  const GetAllKaraHistoryUsecase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, List<KaraHistory>>> call(
    QueryPageParams params,
  ) async {
    return await accountRepository.getAllKaraHistory(queryPageParams: params);
  }
}
