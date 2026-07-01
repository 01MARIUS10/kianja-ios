import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';

class UpdateJobOfferUseCase implements UseCase<JobOffer, UpdateJobOfferParams> {
  const UpdateJobOfferUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, JobOffer>> call(UpdateJobOfferParams params) async {
    return await myPostRepository.updateJobOffer(updateJobOfferParams: params);
  }
}
