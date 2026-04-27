import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobOfferDetailUseCase
    implements UseCase<JobOffer, GetJobOfferDetailParams> {
  const GetJobOfferDetailUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobOffer>> call(GetJobOfferDetailParams params) async {
    return await jobsRepository.getJobOfferDetail(id: params.id);
  }
}

class GetJobOfferDetailParams {
  const GetJobOfferDetailParams({required this.id});

  final int id;
}
