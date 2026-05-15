import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterDetailUseCase
    implements UseCase<TrainingCenter, TrainingCenterDetailParams> {
  const GetTrainingCenterDetailUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, TrainingCenter>> call(
    TrainingCenterDetailParams params,
  ) async {
    return await jobsRepository.getTrainingCenterDetail(id: params.id);
  }
}

class TrainingCenterDetailParams {
  const TrainingCenterDetailParams({required this.id});

  final int id;
}
