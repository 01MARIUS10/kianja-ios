import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_params.dart';

class DeleteJobApplicantUseCase
    implements UseCase<Unit, DeleteJobApplicantParams> {
  const DeleteJobApplicantUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteJobApplicantParams params) async {
    return await myPostRepository.deleteJobApplicant(id: params.id);
  }
}
