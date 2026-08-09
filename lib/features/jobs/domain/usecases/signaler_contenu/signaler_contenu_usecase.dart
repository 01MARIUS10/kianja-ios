import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/signaler/signaler.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/signaler_contenu/signaler_contenu_params.dart';

class SignalerContenuUseCase
    implements UseCase<Signaler, SignalerContenuParams> {
  const SignalerContenuUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, Signaler>> call(SignalerContenuParams params) async {
    return await jobsRepository.signalerContenu(signalerContenuParams: params);
  }
}
