import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobApplicantDetailUseCase
    implements UseCase<JobApplicant, GetJobApplicantDetailParams> {
  const GetJobApplicantDetailUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobApplicant>> call(
    GetJobApplicantDetailParams params,
  ) async {
    return await jobsRepository.getJobApplicantDetail(id: params.id);
  }
}

class GetJobApplicantDetailParams {
  const GetJobApplicantDetailParams({required this.id});
  final int id;
}
