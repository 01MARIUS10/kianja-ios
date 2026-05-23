import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_params.dart';

class DeleteJobOfferUseCase implements UseCase<Unit, DeleteJobOfferParams> {
  const DeleteJobOfferUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, Unit>> call(DeleteJobOfferParams params) async {
    return await myPostRepository.deleteJobOffer(id: params.id);
  }
}
