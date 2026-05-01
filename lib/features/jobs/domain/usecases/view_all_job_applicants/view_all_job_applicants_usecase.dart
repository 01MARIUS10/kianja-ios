import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';

class ViewAllJobApplicantsUseCase
    implements UseCase<List<JobApplicant>, ViewAllJobApplicantsParams> {
  const ViewAllJobApplicantsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobApplicant>>> call(
    ViewAllJobApplicantsParams params,
  ) async {
    return await jobsRepository.viewAllJobApplicants(
      viewAllJobApplicantsParams: params,
    );
  }
}
