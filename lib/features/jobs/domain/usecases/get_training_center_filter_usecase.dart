import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterFilterUseCase
    implements UseCase<TrainingCenterFilter, NoParams> {
  const GetTrainingCenterFilterUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, TrainingCenterFilter>> call(NoParams params) async {
    return await jobsRepository.getTrainingCenterFilter();
  }
}
