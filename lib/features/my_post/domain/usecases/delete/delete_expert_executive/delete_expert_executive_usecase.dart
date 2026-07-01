import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_params.dart';

class DeleteExpertExecutiveUseCase
    implements UseCase<Unit, DeleteExpertExecutiveParams> {
  const DeleteExpertExecutiveUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteExpertExecutiveParams params) async {
    return await myPostRepository.deleteExpertExecutive(id: params.id);
  }
}
