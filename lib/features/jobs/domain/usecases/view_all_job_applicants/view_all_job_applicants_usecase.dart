import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ViewAllJobApplicantsUseCase
    implements UseCase<List<JobApplicant>, QueryPageParams> {
  const ViewAllJobApplicantsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobApplicant>>> call(
    QueryPageParams params,
  ) async {
    return await jobsRepository.viewAllJobApplicants(queryPageParams: params);
  }
}
