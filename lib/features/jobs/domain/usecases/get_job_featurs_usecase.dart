import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetJobFeaturesUseCase implements UseCase<JobFeatures, NoParams> {
  const GetJobFeaturesUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobFeatures>> call(NoParams params) async {
    return await jobsRepository.getJobFeatures();
  }
}
