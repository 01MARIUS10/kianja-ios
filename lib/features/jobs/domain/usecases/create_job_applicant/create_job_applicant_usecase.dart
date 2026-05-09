import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';

class CreateJobApplicantUseCase
    implements UseCase<JobApplicant, CreateJobApplicantParams> {
  const CreateJobApplicantUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobApplicant>> call(
    CreateJobApplicantParams params,
  ) async {
    return await jobsRepository.createJobApplicant(
      createJobApplicantParams: params,
    );
  }
}
