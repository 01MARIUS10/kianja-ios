import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class UploadImageUseCase implements UseCase<JobImage, UploadImageParams> {
  const UploadImageUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobImage>> call(UploadImageParams params) async {
    return await jobsRepository.uploadImage(file: params.file);
  }
}

class UploadImageParams {
  const UploadImageParams({required this.file});

  final XFile file;
}
