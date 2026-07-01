import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';

class UpdateTrainingCenterUseCase
    implements UseCase<TrainingCenter, UpdateTrainingCenterParams> {
  const UpdateTrainingCenterUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, TrainingCenter>> call(
    UpdateTrainingCenterParams params,
  ) async {
    return await myPostRepository.updateTrainingCenter(
      updateTrainingCenterParams: params,
    );
  }
}
