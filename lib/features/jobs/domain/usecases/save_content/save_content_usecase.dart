import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';

class SaveContentUseCase implements UseCase<String, SaveContentParams> {
  const SaveContentUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, String>> call(SaveContentParams params) async {
    return await jobsRepository.saveContent(saveContentParams: params);
  }
}
