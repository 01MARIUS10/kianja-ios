import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';

class GetJobApplicantZoneUseCase
    implements UseCase<List<JobApplicantZone>, GetJobApplicantParams> {
  const GetJobApplicantZoneUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobApplicantZone>>> call(
    GetJobApplicantParams params,
  ) async {
    return await jobsRepository.getJobApplicantsZone(
      getJobApplicantParams: params,
    );
  }
}
