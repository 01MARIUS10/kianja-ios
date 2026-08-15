import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ViewAllJobOffersUseCase
    implements UseCase<List<JobOffer>, QueryPageParams> {
  const ViewAllJobOffersUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobOffer>>> call(QueryPageParams params) async {
    return await jobsRepository.viewAllJobOffers(queryPageParams: params);
  }
}
