import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';

class UpdateExpertExecutiveUseCase
    implements UseCase<ExpertExecutive, UpdateExpertExecutiveParams> {
  const UpdateExpertExecutiveUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, ExpertExecutive>> call(
    UpdateExpertExecutiveParams params,
  ) async {
    return await myPostRepository.updateExpertExecutive(
      updateExpertExecutiveParams: params,
    );
  }
}
