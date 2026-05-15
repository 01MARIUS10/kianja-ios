import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterCategoriesUseCase
    implements UseCase<List<JobCategory>, NoParams> {
  const GetTrainingCenterCategoriesUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<JobCategory>>> call(NoParams params) async {
    return await jobsRepository.getTrainingCenterCategories();
  }
}
