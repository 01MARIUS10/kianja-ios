import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterHotEventUseCase
    implements UseCase<List<TrainingCenterHotEvent>, NoParams> {
  const GetTrainingCenterHotEventUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<TrainingCenterHotEvent>>> call(
    NoParams params,
  ) async {
    return await jobsRepository.getTrainingCenterHotEvent();
  }
}
