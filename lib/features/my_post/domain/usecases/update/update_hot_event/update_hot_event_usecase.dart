import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_params.dart';

class UpdateHotEventUseCase implements UseCase<HotEvent, UpdateHotEventParams> {
  const UpdateHotEventUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, HotEvent>> call(UpdateHotEventParams params) async {
    return await myPostRepository.updateHotEvent(updateHotEventParams: params);
  }
}
