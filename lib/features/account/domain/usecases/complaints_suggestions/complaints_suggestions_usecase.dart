import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/complaints_suggestions/complaints_suggestions_params.dart';

class ComplaintsSuggestionsUseCase
    implements UseCase<Unit, ComplaintsSuggestionsParams> {
  const ComplaintsSuggestionsUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(ComplaintsSuggestionsParams params) async {
    return await accountRepository.sendComplaintsSuggestions(
      complaintsSuggestionsParams: params,
    );
  }
}
