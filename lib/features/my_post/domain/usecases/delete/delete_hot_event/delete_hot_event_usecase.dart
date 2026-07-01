import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_params.dart';

class DeleteHotEventUseCase implements UseCase<Unit, DeleteHotEventParams> {
  const DeleteHotEventUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteHotEventParams params) async {
    return await myPostRepository.deleteHotEvent(deleteHotEventParams: params);
  }
}
