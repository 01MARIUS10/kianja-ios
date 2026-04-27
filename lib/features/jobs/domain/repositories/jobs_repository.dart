import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';

abstract interface class JobsRepository {
  Future<Either<Failure, JobFeatures>> getJobFeatures();
  Future<Either<Failure, List<JobOfferFilter>>> getJobOffersGroupBy({
    required String query,
  });
  Future<Either<Failure, List<JobOffer>>> viewAllJobOffers({
    required String query,
  });
  Future<Either<Failure, JobImage>> uploadImage({required XFile file});
  Future<Either<Failure, JobPdf>> uploadPdf({required PlatformFile file});
  Future<Either<Failure, JobOffer>> createJobOffer({
    required String title,
    required int imageId,
    required String description,
    required List<int> categories,
    required int location,
    required int gender,
    required int actor,
    required String limitDate,
    required String status,
  });
  Future<Either<Failure, JobOffer>> getJobOfferDetail({required int id});
}
