import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';

class CreateTrainingCenterUseCase
    implements UseCase<TrainingCenter, CreateTrainingCenterParams> {
  const CreateTrainingCenterUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, TrainingCenter>> call(
    CreateTrainingCenterParams params,
  ) async {
    return await jobsRepository.createTrainingCenter(
      createTrainingCenterParams: params,
    );
  }
}
