import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';

class CreateJobOfferUseCase implements UseCase<JobOffer, CreateJobOfferParams> {
  const CreateJobOfferUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobOffer>> call(CreateJobOfferParams params) async {
    return await jobsRepository.createJobOffer(createJobOfferParams: params);
  }
}
