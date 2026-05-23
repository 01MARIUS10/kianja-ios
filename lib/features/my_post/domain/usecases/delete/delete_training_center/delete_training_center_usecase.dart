import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_params.dart';

class DeleteTrainingCenterUseCase
    implements UseCase<Unit, DeleteTrainingCenterParams> {
  const DeleteTrainingCenterUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteTrainingCenterParams params) async {
    return await myPostRepository.deleteTrainingCenter(id: params.id);
  }
}
