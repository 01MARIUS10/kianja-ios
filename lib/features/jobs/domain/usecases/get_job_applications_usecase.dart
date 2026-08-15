import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobApplicationsUseCase
    implements UseCase<List<JobOffer>, QueryPageParams> {
  const GetJobApplicationsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobOffer>>> call(QueryPageParams params) async {
    return await jobsRepository.getJobApplications(queryPageParams: params);
  }
}
