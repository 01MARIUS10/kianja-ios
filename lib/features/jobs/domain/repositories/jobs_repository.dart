import 'package:file_picker/file_picker.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/errors/failures.dart';
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
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';

abstract interface class JobsRepository {
  Future<Either<Failure, JobFeatures>> getJobFeatures();
  Future<Either<Failure, List<JobCategory>>> getJobApplicantProfessions();
  Future<Either<Failure, JobApplicantFilter>> getJobApplicantFilters();
  Future<Either<Failure, List<JobOfferFilter>>> getJobOffersGroupBy({
    required String query,
  });
  Future<Either<Failure, List<JobOffer>>> viewAllJobOffers({
    required String query,
  });
  Future<Either<Failure, List<HotEvent>>> viewAllHotEvents({
    required String query,
  });
  Future<Either<Failure, List<TrainingCenter>>> viewAllTrainingCenters({
    required String query,
  });
  Future<Either<Failure, TrainingCenterViewCategoryModel>>
  getTrainingCenterViewCategory({required int id});
  Future<Either<Failure, List<JobApplicantZone>>> getJobApplicantsZone({
    required GetJobApplicantParams getJobApplicantParams,
  });
  Future<Either<Failure, List<JobApplicant>>> viewAllJobApplicants({
    required ViewAllJobApplicantsParams viewAllJobApplicantsParams,
  });
  Future<Either<Failure, JobImage>> uploadImage({required XFile file});
  Future<Either<Failure, JobPdf>> uploadPdf({required PlatformFile file});
  Future<Either<Failure, List<JobApplicantPlan>>> getJobApplicantPlans();
  Future<Either<Failure, JobApplicant>> createJobApplicant({
    required CreateJobApplicantParams createJobApplicantParams,
  });
  Future<Either<Failure, List<TrainingCenterHotEvent>>>
  getTrainingCenterHotEvent();
  Future<Either<Failure, TrainingCenterFilter>> getTrainingCenterFilter();
  Future<Either<Failure, List<JobCategory>>> getTrainingCenterCategories();
  Future<Either<Failure, JobOffer>> createJobOffer({
    required CreateJobOfferParams createJobOfferParams,
  });
  Future<Either<Failure, JobOffer>> getJobOfferDetail({required int id});
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
}
