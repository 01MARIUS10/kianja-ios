import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobOffersGroupByUseCase
    implements UseCase<List<JobOfferFilter>, GetJobOffersGroupByParams> {
  const GetJobOffersGroupByUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobOfferFilter>>> call(
    GetJobOffersGroupByParams params,
  ) async {
    return await jobsRepository.getJobOffersGroupBy(query: params.query);
  }
}

class GetJobOffersGroupByParams {
  const GetJobOffersGroupByParams({required this.query});

  final String query;
}
