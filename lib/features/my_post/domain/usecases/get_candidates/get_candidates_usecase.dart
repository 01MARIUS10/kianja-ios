import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_params.dart';

class GetCandidatesUseCase implements UseCase<List<User>, GetCandidatesParams> {
  const GetCandidatesUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, List<User>>> call(GetCandidatesParams params) async {
    return await myPostRepository.getAllCandidates(getCandidatesParams: params);
  }
}
