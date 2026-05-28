import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_params.dart';

class CreateHotEventUseCase implements UseCase<HotEvent, CreateHotEventParams> {
  const CreateHotEventUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, HotEvent>> call(CreateHotEventParams params) async {
    return await jobsRepository.createHotEvent(createHotEventParams: params);
  }
}
