import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';

class GetCandidateUseCase implements UseCase<User, GetCandidateParams> {
  const GetCandidateUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, User>> call(GetCandidateParams params) async {
    return await myPostRepository.getCandidate(getCandidateParams: params);
  }
}

class GetCandidateParams {
  const GetCandidateParams({required this.id});

  final int id;
}
