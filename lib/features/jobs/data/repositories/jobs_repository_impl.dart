import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/jobs/data/datasources/jobs_remote_data.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';

class JobsRepositoryImpl implements JobsRepository {
  const JobsRepositoryImpl({required this.remoteDataSource});
  final JobsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, JobFeatures>> getJobFeatures() async {
    try {
      final response = await remoteDataSource.getJobFeatures();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobCategory>>>
  getJobApplicantProfessions() async {
    try {
      final response = await remoteDataSource.getJobApplicantProfessions();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobApplicantFilter>> getJobApplicantFilters() async {
    try {
      final response = await remoteDataSource.getJobApplicantFilters();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobOfferFilter>>> getJobOffersGroupBy({
    required String query,
  }) async {
    try {
      AppDebug.showPrint('query $query');
      final response = await remoteDataSource.getJobOffersGroupBy(query: query);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobOffer>>> viewAllJobOffers({
    required String query,
  }) async {
    try {
      final response = await remoteDataSource.viewAllJobOffers(query: query);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobApplicantZone>>> getJobApplicantsZone({
    required GetJobApplicantParams getJobApplicantParams,
  }) async {
    try {
      final response = await remoteDataSource.getJobApplicantsZone(
        query: getJobApplicantParams.query,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobApplicant>>> viewAllJobApplicants({
    required ViewAllJobApplicantsParams viewAllJobApplicantsParams,
  }) async {
    try {
      final response = await remoteDataSource.viewAllJobApplicants(
        query: viewAllJobApplicantsParams.query,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobImage>> uploadImage({required XFile file}) async {
    try {
      final response = await remoteDataSource.uploadJobImage(file: file);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobPdf>> uploadPdf({
    required PlatformFile file,
  }) async {
    try {
      final response = await remoteDataSource.uploadJobPdf(file: file);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
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
  }) async {
    try {
      final response = await remoteDataSource.createJobOffer(
        title: title,
        imageId: imageId,
        description: description,
        categories: categories,
        location: location,
        gender: gender,
        actor: actor,
        limitDate: limitDate,
        status: status,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobOffer>> getJobOfferDetail({required int id}) async {
    try {
      final response = await remoteDataSource.getJobOfferDetail(id: id);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobApplicant>> getJobApplicantDetail({
    required int id,
  }) async {
    try {
      final response = await remoteDataSource.getJobApplicantDetail(id: id);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
