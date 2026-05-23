import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';

class UpdateJobApplicantUseCase
    implements UseCase<JobApplicant, UpdateJobApplicantParams> {
  const UpdateJobApplicantUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, JobApplicant>> call(
    UpdateJobApplicantParams params,
  ) async {
    return await myPostRepository.updateJobApplicant(
      updateJobApplicantParams: params,
    );
  }
}
