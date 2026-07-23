import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ApplyToOfferUseCase implements UseCase<String, ApplyToOfferParams> {
  const ApplyToOfferUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, String>> call(ApplyToOfferParams params) async {
    return await jobsRepository.applyToOffer(id: params.id);
  }
}

class ApplyToOfferParams {
  const ApplyToOfferParams({required this.id});

  final int id;
}
