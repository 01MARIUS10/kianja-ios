import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';

class GetHotEventDetailUseCase
    implements UseCase<HotEvent, GetHotEventDetailParams> {
  const GetHotEventDetailUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, HotEvent>> call(GetHotEventDetailParams params) async {
    return await jobsRepository.getHotEventDetail(
      getHotEventDetailParams: params,
    );
  }
}
