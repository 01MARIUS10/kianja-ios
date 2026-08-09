import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class BlockedUsersUseCase implements UseCase<List<User>, QueryPageParams> {
  const BlockedUsersUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, List<User>>> call(QueryPageParams params) async {
    return await accountRepository.getBlockedUsers(queryPageParams: params);
  }
}
