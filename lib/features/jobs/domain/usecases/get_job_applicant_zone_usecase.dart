import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobApplicantZoneUseCase
    implements UseCase<List<JobApplicantZone>, NoParams> {
  const GetJobApplicantZoneUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobApplicantZone>>> call(NoParams params) async {
    return await jobsRepository.getJobApplicantsZone();
  }
}
