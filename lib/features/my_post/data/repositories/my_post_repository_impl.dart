import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/data/datasources/remote/my_post_remote_data.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_expert_executive/update_expert_executive_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_applicant/update_job_applicant_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_offer/update_job_offer_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_training_center/update_training_center_input_model.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';

class MyPostRepositoryImpl implements MyPostRepository {
  const MyPostRepositoryImpl({required this.myPostRemoteData});
  final MyPostRemoteData myPostRemoteData;

  @override
  Future<Either<Failure, Unit>> deleteJobOffer({required int id}) async {
    try {
      await myPostRemoteData.deleteJobOffer(id: id);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteJobApplicant({required int id}) async {
    try {
      await myPostRemoteData.deleteJobApplicant(id: id);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTrainingCenter({required int id}) async {
    try {
      await myPostRemoteData.deleteTrainingCenter(id: id);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteExpertExecutive({required int id}) async {
    try {
      await myPostRemoteData.deleteExpertExecutive(id: id);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobOffer>> updateJobOffer({
    required UpdateJobOfferParams updateJobOfferParams,
  }) async {
    try {
      final jobOffer = await myPostRemoteData.updateJobOffer(
        updateJobOfferInputModel: UpdateJobOfferInputModel(
          id: updateJobOfferParams.id,
          title: updateJobOfferParams.title,
          description: updateJobOfferParams.description,
          imageId: updateJobOfferParams.imageId,
          categories: updateJobOfferParams.categories,
          locationId: updateJobOfferParams.location,
          genderId: updateJobOfferParams.gender,
          limitDate: updateJobOfferParams.limitDate,
          status: updateJobOfferParams.status,
          actorId: updateJobOfferParams.actor,
        ),
      );
      return right(jobOffer);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobApplicant>> updateJobApplicant({
    required UpdateJobApplicantParams updateJobApplicantParams,
  }) async {
    try {
      final jobApplicant = await myPostRemoteData.updateJobApplicant(
        updateJobApplicantInputModel: UpdateJobApplicantInputModel(
          id: updateJobApplicantParams.id,
          title: updateJobApplicantParams.title,
          motivation: updateJobApplicantParams.motivation,
          imageUrl: updateJobApplicantParams.imageUrl,
          pdfUrl: updateJobApplicantParams.pdfUrl,
          locationId: updateJobApplicantParams.locationId,
          genderId: updateJobApplicantParams.genderId,
          typeId: updateJobApplicantParams.typeId,
          durationId: updateJobApplicantParams.durationId,
          categoryId: updateJobApplicantParams.categoryId,
          status: updateJobApplicantParams.status,
        ),
      );
      return right(jobApplicant);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, TrainingCenter>> updateTrainingCenter({
    required UpdateTrainingCenterParams updateTrainingCenterParams,
  }) async {
    try {
      final trainingCenter = await myPostRemoteData.updateTrainingCenter(
        updateTrainingCenterInputModel: UpdateTrainingCenterInputModel(
          id: updateTrainingCenterParams.id,
          name: updateTrainingCenterParams.name,
          description: updateTrainingCenterParams.description,
          locationId: updateTrainingCenterParams.locationId,
          imageIds: updateTrainingCenterParams.imageIds,
          actorId: updateTrainingCenterParams.actorId,
          typeId: updateTrainingCenterParams.typeId,
          tagId: updateTrainingCenterParams.tagId,
          durationId: updateTrainingCenterParams.durationId,
          status: updateTrainingCenterParams.status,
        ),
      );
      return right(trainingCenter);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, ExpertExecutive>> updateExpertExecutive({
    required UpdateExpertExecutiveParams updateExpertExecutiveParams,
  }) async {
    try {
      final expertExecutive = await myPostRemoteData.updateExpertExecutive(
        updateExpertExecutiveInputModel: UpdateExpertExecutiveInputModel(
          id: updateExpertExecutiveParams.id,
          firstName: updateExpertExecutiveParams.firstName,
          lastName: updateExpertExecutiveParams.lastName,
          dateOfBirth: updateExpertExecutiveParams.dateOfBirth,
          email: updateExpertExecutiveParams.email,
          phoneNumber: updateExpertExecutiveParams.phoneNumber,
          address: updateExpertExecutiveParams.address,
          biography: updateExpertExecutiveParams.biography,
          domainId: updateExpertExecutiveParams.domainId,
          cvPdfId: updateExpertExecutiveParams.cvPdfId,
        ),
      );
      return right(expertExecutive);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobOffer>>> getAllJobOffers({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final jobOffers = await myPostRemoteData.getAllJobOffers(
        page: queryPageParams.page,
      );
      return right(jobOffers);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<JobApplicant>>> getAllJobApplicants({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final jobApplicants = await myPostRemoteData.getAllJobApplicants(
        page: queryPageParams.page,
      );
      return right(jobApplicants);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
