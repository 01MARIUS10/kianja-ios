import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/jobs/data/datasources/jobs_remote_data.dart';
import 'package:kianja/features/jobs/data/models/input/create_job_applicant/create_job_applicant_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/create_job_offer/create_job_offer_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/create_training_center/create_training_center_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/hot_event/hot_event_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/subscribe_expert_executive/subscribe_expert_executive_input_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_view_category/training_center_view_category_model.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_plan.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';

class JobsRepositoryImpl implements JobsRepository {
  const JobsRepositoryImpl({required this.remoteDataSource});
  final JobsRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, TrainingCenterViewCategoryModel>>
  getTrainingCenterViewCategory({required int id}) async {
    try {
      final response = await remoteDataSource.getTrainingCenterViewCategory(
        id: id,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<HotEvent>>> viewAllHotEvents({
    required String query,
  }) async {
    try {
      final response = await remoteDataSource.viewAllHotEvents(query: query);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, HotEvent>> getHotEventDetail({
    required GetHotEventDetailParams getHotEventDetailParams,
  }) async {
    try {
      final response = await remoteDataSource.getHotEventDetail(
        query: getHotEventDetailParams.query,
        id: getHotEventDetailParams.id,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, TrainingCenter>> getTrainingCenterDetail({
    required int id,
  }) async {
    try {
      final response = await remoteDataSource.getTrainingCenterDetail(id: id);
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<TrainingCenter>>> viewAllTrainingCenters({
    required String query,
  }) async {
    try {
      final response = await remoteDataSource.viewAllTrainingCenters(
        query: query,
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<TrainingCenterHotEvent>>>
  getTrainingCenterHotEvent() async {
    try {
      final response = await remoteDataSource.getTrainingCenterHotEvent();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, TrainingCenterFilter>>
  getTrainingCenterFilter() async {
    try {
      final response = await remoteDataSource.getTrainingCenterFilter();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, TrainingCenter>> createTrainingCenter({
    required CreateTrainingCenterParams createTrainingCenterParams,
  }) async {
    try {
      final response = await remoteDataSource.createTrainingCenter(
        createTrainingCenterInputModel: CreateTrainingCenterInputModel(
          name: createTrainingCenterParams.name,
          description: createTrainingCenterParams.description,
          locationId: createTrainingCenterParams.locationId,
          imageIds: createTrainingCenterParams.imageIds,
          actorId: createTrainingCenterParams.actorId,
          typeId: createTrainingCenterParams.typeId,
          tagId: createTrainingCenterParams.tagId,
          durationId: createTrainingCenterParams.durationId,
          status: createTrainingCenterParams.status,
        ),
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

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
  Future<Either<Failure, List<JobCategory>>>
  getTrainingCenterCategories() async {
    try {
      final response = await remoteDataSource.getTrainingCenterCategories();
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
  Future<Either<Failure, List<JobApplicantPlan>>> getJobApplicantPlans() async {
    try {
      final response = await remoteDataSource.getJobApplicantPlans();
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, ExpertExecutive>> subscribeExpertExecutive({
    required SubscribeExpertExecutiveParams subscribeExpertExecutiveParams,
  }) async {
    try {
      final response = await remoteDataSource.subscribeExpertExecutive(
        subscribeExpertExecutiveInputModel: SubscribeExpertExecutiveInputModel(
          firstName: subscribeExpertExecutiveParams.firstName,
          lastName: subscribeExpertExecutiveParams.lastName,
          dateOfBirth: subscribeExpertExecutiveParams.dateOfBirth,
          email: subscribeExpertExecutiveParams.email,
          phoneNumber: subscribeExpertExecutiveParams.phoneNumber,
          address: subscribeExpertExecutiveParams.address,
          biography: subscribeExpertExecutiveParams.biography,
          domainId: subscribeExpertExecutiveParams.domainId,
          cvPdfId: subscribeExpertExecutiveParams.cvPdfId,
        ),
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobApplicant>> createJobApplicant({
    required CreateJobApplicantParams createJobApplicantParams,
  }) async {
    try {
      final response = await remoteDataSource.createJobApplicant(
        createJobApplicantInputModel: CreateJobApplicantInputModel(
          title: createJobApplicantParams.title,
          motivation: createJobApplicantParams.motivation,
          imageUrl: createJobApplicantParams.imageUrl,
          pdfUrl: createJobApplicantParams.pdfUrl,
          locationId: createJobApplicantParams.locationId,
          genderId: createJobApplicantParams.genderId,
          typeId: createJobApplicantParams.typeId,
          durationId: createJobApplicantParams.durationId,
          categoryId: createJobApplicantParams.categoryId,
          status: createJobApplicantParams.status,
        ),
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, JobOffer>> createJobOffer({
    required CreateJobOfferParams createJobOfferParams,
  }) async {
    try {
      final response = await remoteDataSource.createJobOffer(
        createJobOfferInputModel: CreateJobOfferInputModel(
          title: createJobOfferParams.title,
          description: createJobOfferParams.description,
          imageId: createJobOfferParams.imageId,
          categories: createJobOfferParams.categories,
          locationId: createJobOfferParams.location,
          genderId: createJobOfferParams.gender,
          actorId: createJobOfferParams.actor,
          limitDate: createJobOfferParams.limitDate,
          status: createJobOfferParams.status,
        ),
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

  @override
  Future<Either<Failure, HotEvent>> createHotEvent({
    required CreateHotEventParams createHotEventParams,
  }) async {
    try {
      final response = await remoteDataSource.createHotEvent(
        hotEventInputModel: HotEventInputModel(
          trainingCenterId: createHotEventParams.trainingCenterId,
          id: -1,
          type: createHotEventParams.type,
          title: createHotEventParams.title,
          description: createHotEventParams.description,
          imageId: createHotEventParams.imageId,
          startDate: createHotEventParams.startDate,
          endDate: createHotEventParams.endDate,
        ),
      );
      return right(response);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
