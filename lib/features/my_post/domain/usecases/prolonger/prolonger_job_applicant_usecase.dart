import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_params.dart';

class ProlongerJobApplicantUseCase
    implements UseCase<JobApplicant, ProlongerJobApplicantParams> {
  const ProlongerJobApplicantUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, JobApplicant>> call(
    ProlongerJobApplicantParams params,
  ) async {
    return await myPostRepository.prolongerJobApplicant(
      prolongerJobApplicantParams: params,
    );
  }
}
