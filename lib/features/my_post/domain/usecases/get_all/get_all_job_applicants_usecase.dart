import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';

class GetAllJobApplicantsUseCase
    implements UseCase<List<JobApplicant>, QueryPageParams> {
  const GetAllJobApplicantsUseCase({required this.myPostRepository});

  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, List<JobApplicant>>> call(
    QueryPageParams params,
  ) async {
    return await myPostRepository.getAllJobApplicants(
      queryPageParams: params,
    );
  }
}

