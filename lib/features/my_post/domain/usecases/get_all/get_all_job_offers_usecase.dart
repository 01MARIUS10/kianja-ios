import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';

class GetAllJobOffersUseCase implements UseCase<List<JobOffer>, NoParams> {
  const GetAllJobOffersUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, List<JobOffer>>> call(NoParams params) async {
    return await myPostRepository.getAllJobOffers();
  }
}
