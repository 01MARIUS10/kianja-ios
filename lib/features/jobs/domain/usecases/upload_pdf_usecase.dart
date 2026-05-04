import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class UploadPdfUseCase implements UseCase<JobPdf, UploadPdfParams> {
  const UploadPdfUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, JobPdf>> call(UploadPdfParams params) async {
    return await jobsRepository.uploadPdf(file: params.file);
  }
}

class UploadPdfParams {
  const UploadPdfParams({required this.file});

  final PlatformFile file;
}
