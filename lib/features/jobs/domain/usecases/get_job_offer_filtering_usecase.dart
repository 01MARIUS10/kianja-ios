import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filtering.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobOfferFilteringUseCase
    implements UseCase<JobOfferFiltering, NoParams> {
  const GetJobOfferFilteringUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobOfferFiltering>> call(NoParams params) async {
    return await jobsRepository.getJobOfferFiltering();
  }
}
