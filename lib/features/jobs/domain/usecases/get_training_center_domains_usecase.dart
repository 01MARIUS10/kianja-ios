import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterDomainsUseCase
    implements UseCase<List<JobDomain>, NoParams> {
  const GetTrainingCenterDomainsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobDomain>>> call(NoParams params) async {
    return await jobsRepository.getTrainingCenterDomains();
  }
}
