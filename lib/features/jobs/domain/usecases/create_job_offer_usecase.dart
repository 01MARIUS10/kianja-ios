import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class CreateJobOfferUseCase implements UseCase<JobOffer, CreateJobOfferParams> {
  const CreateJobOfferUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobOffer>> call(CreateJobOfferParams params) async {
    return await jobsRepository.createJobOffer(
      title: params.title,
      imageId: params.imageId,
      description: params.description,
      categories: params.categories,
      location: params.location,
      gender: params.gender,
      actor: params.actor,
      limitDate: params.limitDate,
      status: params.status,
    );
  }
}

class CreateJobOfferParams {
  const CreateJobOfferParams({
    required this.title,
    required this.imageId,
    required this.description,
    required this.categories,
    required this.location,
    required this.gender,
    required this.actor,
    required this.limitDate,
    required this.status,
  });

  final String title;
  final int imageId;
  final String description;
  final List<int> categories;
  final int location;
  final int gender;
  final int actor;
  final String limitDate;
  final String status;
}
