import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class ViewAllHotEventUseCase
    implements UseCase<List<HotEvent>, ViewAllHotEventParams> {
  const ViewAllHotEventUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<HotEvent>>> call(
    ViewAllHotEventParams params,
  ) async {
    return await jobsRepository.viewAllHotEvents(query: params.query);
  }
}

class ViewAllHotEventParams {
  const ViewAllHotEventParams({required this.query});

  final String query;
}
