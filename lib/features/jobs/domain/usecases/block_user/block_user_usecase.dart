import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_params.dart';

class BlockUserUseCase implements UseCase<Unit, BlockUserParams> {
  const BlockUserUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, Unit>> call(BlockUserParams params) async {
    return await jobsRepository.blockUser(blockUserParams: params);
  }
}
