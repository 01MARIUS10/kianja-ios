import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/data/models/input/hot_event/hot_event_input_model.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/data/datasources/remote/my_post_remote_data.dart';
import 'package:kianja/features/my_post/data/models/inputs/prolonger_job_applicant/prolonger_job_applicant_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_expert_executive/update_expert_executive_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_applicant/update_job_applicant_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_offer/update_job_offer_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_training_center/update_training_center_input_model.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_params.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidate_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_params.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_params.dart';
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
  Future<Either<Failure, Unit>> deleteHotEvent({
    required DeleteHotEventParams deleteHotEventParams,
  }) async {
    try {
      await myPostRemoteData.deleteHotEvent(
        id: deleteHotEventParams.id,
        type: deleteHotEventParams.type,
      );
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
          imageIds: updateJobOfferParams.imageIds,
          imageId: updateJobOfferParams.imageId,
          categories: updateJobOfferParams.categories,
          locations: updateJobOfferParams.locations,
          // locationId: updateJobOfferParams.location,
          genderId: updateJobOfferParams.gender,
          limitDate: updateJobOfferParams.limitDate,
          status: updateJobOfferParams.status,
          actorId: updateJobOfferParams.actor,
          showButton: updateJobOfferParams.showPostButton,
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
          photoUrl: updateJobApplicantParams.photoUrl,
          motivation: updateJobApplicantParams.motivation,
          pdfUrl: updateJobApplicantParams.pdfUrl,
          locations: updateJobApplicantParams.locations,
          categories: updateJobApplicantParams.categories,
          // locationId: updateJobApplicantParams.locationId,
          genderId: updateJobApplicantParams.genderId,
          // typeId: updateJobApplicantParams.typeId,
          // durationId: updateJobApplicantParams.durationId,
          // categoryId: updateJobApplicantParams.categoryId,
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
          // typeId: updateTrainingCenterParams.typeId,
          // tagId: updateTrainingCenterParams.tagId,
          // durationId: updateTrainingCenterParams.durationId,
          status: updateTrainingCenterParams.status,
          domainId: updateTrainingCenterParams.domainId,
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
  Future<Either<Failure, HotEvent>> updateHotEvent({
    required UpdateHotEventParams updateHotEventParams,
  }) async {
    try {
      final hotEvent = await myPostRemoteData.updateHotEvent(
        hotEventInputModel: HotEventInputModel(
          trainingCenterId: updateHotEventParams.trainingCenterId,
          id: updateHotEventParams.id,
          type: updateHotEventParams.type,
          imageId: updateHotEventParams.imageId,
          title: updateHotEventParams.title,
          description: updateHotEventParams.description,
          startDate: updateHotEventParams.startDate,
          endDate: updateHotEventParams.endDate,
        ),
      );
      return right(hotEvent);
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

  @override
  Future<Either<Failure, List<TrainingCenter>>> getAllTrainingCenters({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final trainingCenters = await myPostRemoteData.getAllTrainingCenters(
        page: queryPageParams.page,
      );
      return right(trainingCenters);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<HotEvent>>> getAllHots({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final hots = await myPostRemoteData.getAllHots(
        page: queryPageParams.page,
      );
      return right(hots);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<HotEvent>>> getAllEvents({
    required QueryPageParams queryPageParams,
  }) async {
    try {
      final events = await myPostRemoteData.getAllEvents(
        page: queryPageParams.page,
      );
      return right(events);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getAllCandidates({
    required GetCandidatesParams getCandidatesParams,
  }) async {
    try {
      final candidates = await myPostRemoteData.getAllCandidates(
        jobId: getCandidatesParams.jobId,
        page: getCandidatesParams.page,
      );
      return right(candidates);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, User>> getCandidate({
    required GetCandidateParams getCandidateParams,
  }) async {
    try {
      final candidate = await myPostRemoteData.getCandidate(
        id: getCandidateParams.id,
      );
      return right(candidate);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobApplicant>> prolongerJobApplicant({
    required ProlongerJobApplicantParams prolongerJobApplicantParams,
  }) async {
    try {
      final jobApplicant = await myPostRemoteData.prolongerJobApplicant(
        prolongerJobApplicantInputModel: ProlongerJobApplicantInputModel(
          id: prolongerJobApplicantParams.id,
          typeId: prolongerJobApplicantParams.typeId,
          durationId: prolongerJobApplicantParams.durationId,
        ),
      );
      return right(jobApplicant);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
