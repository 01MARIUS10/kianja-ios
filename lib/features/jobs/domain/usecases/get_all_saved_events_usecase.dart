import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetAllSavedEventsUseCase
    implements UseCase<List<HotEvent>, QueryPageParams> {
  const GetAllSavedEventsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<HotEvent>>> call(QueryPageParams params) async {
    return await jobsRepository.getAllSavedEvents(queryPageParams: params);
  }
}
