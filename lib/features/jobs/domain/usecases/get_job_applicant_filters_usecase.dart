import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobApplicantFiltersUseCase
    implements UseCase<JobApplicantFilter, NoParams> {
  const GetJobApplicantFiltersUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobApplicantFilter>> call(NoParams params) async {
    return await jobsRepository.getJobApplicantFilters();
  }
}
