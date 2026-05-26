import 'package:kianja/features/jobs/data/models/output/expert/expert_executive_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant/job_applicant_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer/job_offer_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_expert_executive/update_expert_executive_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_applicant/update_job_applicant_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_offer/update_job_offer_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_training_center/update_training_center_input_model.dart';

abstract interface class MyPostRemoteData {
  // Delete
  Future<void> deleteJobOffer({required int id});
  Future<void> deleteJobApplicant({required int id});
  Future<void> deleteTrainingCenter({required int id});
  Future<void> deleteExpertExecutive({required int id});
  // Future<void> deleteHot({required int id});
  // Future<void> deleteEvent({required int id});

  // Update
  Future<JobOfferModel> updateJobOffer({
    required UpdateJobOfferInputModel updateJobOfferInputModel,
  });
  Future<JobApplicantModel> updateJobApplicant({
    required UpdateJobApplicantInputModel updateJobApplicantInputModel,
  });
  Future<TrainingCenterModel> updateTrainingCenter({
    required UpdateTrainingCenterInputModel updateTrainingCenterInputModel,
  });
  Future<ExpertExecutiveModel> updateExpertExecutive({
    required UpdateExpertExecutiveInputModel updateExpertExecutiveInputModel,
  });

  // GET ALL LIST
  Future<List<JobOfferModel>> getAllJobOffers({required int page});
  // Future<List<JobApplicantModel>> getAllJobApplicants();
  // Future<List<TrainingCenterModel>> getAllTrainingCenters();
  // Future<List<ExpertExecutiveModel>> getAllExpertExecutives();
}
