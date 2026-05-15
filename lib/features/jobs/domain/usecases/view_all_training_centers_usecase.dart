import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ViewAllTrainingCenterUseCase
    implements UseCase<List<TrainingCenter>, ViewAllTrainingCentersParams> {
  const ViewAllTrainingCenterUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<TrainingCenter>>> call(
    ViewAllTrainingCentersParams params,
  ) async {
    return await jobsRepository.viewAllTrainingCenters(query: params.query);
  }
}

class ViewAllTrainingCentersParams {
  const ViewAllTrainingCentersParams({required this.query});

  final String query;
}
