import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/motif/motif.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetMotifsUseCase implements UseCase<List<Motif>, NoParams> {
  const GetMotifsUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<Motif>>> call(NoParams params) async {
    return await jobsRepository.getMotifs();
  }
}
