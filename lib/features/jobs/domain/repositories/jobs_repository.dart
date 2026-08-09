import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_view_domain/training_center_view_domain_model.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filtering.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_params.dart';

abstract interface class JobsRepository {
  Future<Either<Failure, JobFeatures>> getJobFeatures();
  Future<Either<Failure, List<JobCategory>>> getJobApplicantProfessions();
  Future<Either<Failure, JobApplicantFilter>> getJobApplicantFilters();
  Future<Either<Failure, JobOfferFiltering>> getJobOfferFiltering();
  Future<Either<Failure, List<JobOfferFilter>>> getJobOffersGroupBy({
    required String query,
  });
  Future<Either<Failure, List<JobOffer>>> viewAllJobOffers({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<HotEvent>>> viewAllHotEvents({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<TrainingCenter>>> viewAllTrainingCenters({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, TrainingCenterViewDomainModel>>
  getTrainingCenterViewDomain({required int id});
  Future<Either<Failure, List<JobApplicantZone>>> getJobApplicantsZone({
    required GetJobApplicantParams getJobApplicantParams,
  });
  Future<Either<Failure, List<JobApplicant>>> viewAllJobApplicants({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, JobImage>> uploadImage({required XFile file});
  Future<Either<Failure, JobPdf>> uploadPdf({required PlatformFile file});
  Future<Either<Failure, List<PricePlan>>> getPricePlans({
    required GetPricePlanParams getPricePlanParams,
  });
  Future<Either<Failure, JobApplicant>> createJobApplicant({
    required CreateJobApplicantParams createJobApplicantParams,
  });
  Future<Either<Failure, List<TrainingCenterHotEvent>>>
  getTrainingCenterHotEvent();
  Future<Either<Failure, TrainingCenterFilter>> getTrainingCenterFilter();
  Future<Either<Failure, List<JobDomain>>> getTrainingCenterDomains();
  Future<Either<Failure, JobOffer>> createJobOffer({
    required CreateJobOfferParams createJobOfferParams,
  });
  Future<Either<Failure, JobOffer>> getJobOfferDetail({required int id});
  Future<Either<Failure, String>> applyToOffer({required int id});
  Future<Either<Failure, String>> saveContent({
    required SaveContentParams saveContentParams,
  });
  Future<Either<Failure, List<JobOffer>>> getAllSavedJobOffers({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<JobApplicant>>> getAllSavedJobApplicants({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<TrainingCenter>>> getAllSavedTrainingCenters({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<HotEvent>>> getAllSavedHots({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<HotEvent>>> getAllSavedEvents({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<JobOffer>>> getJobApplications({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, JobApplicant>> getJobApplicantDetail({
    required int id,
  });
  Future<Either<Failure, HotEvent>> getHotEventDetail({
    required GetHotEventDetailParams getHotEventDetailParams,
  });
  Future<Either<Failure, TrainingCenter>> getTrainingCenterDetail({
    required int id,
  });
  Future<Either<Failure, TrainingCenter>> createTrainingCenter({
    required CreateTrainingCenterParams createTrainingCenterParams,
  });
  Future<Either<Failure, ExpertExecutive>> subscribeExpertExecutive({
    required SubscribeExpertExecutiveParams subscribeExpertExecutiveParams,
  });
  Future<Either<Failure, HotEvent>> createHotEvent({
    required CreateHotEventParams createHotEventParams,
  });
  Future<Either<Failure, User>> viewUserProfile({
    required ViewUserProfileParams viewUserProfileParams,
  });
  Future<Either<Failure, Unit>> blockUser({
    required BlockUserParams blockUserParams,
  });
}
