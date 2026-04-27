import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ViewAllJobOffersUseCase
    implements UseCase<List<JobOffer>, ViewAllJobOffersParams> {
  const ViewAllJobOffersUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobOffer>>> call(
    ViewAllJobOffersParams params,
  ) async {
    return await jobsRepository.viewAllJobOffers(query: params.query);
  }
}

class ViewAllJobOffersParams {
  const ViewAllJobOffersParams({required this.query});

  final String query;
}
