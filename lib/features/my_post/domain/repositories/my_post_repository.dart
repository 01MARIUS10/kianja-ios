import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_params.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidate_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_params.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';

abstract class MyPostRepository {
  // Delete
  Future<Either<Failure, Unit>> deleteJobOffer({required int id});
  Future<Either<Failure, Unit>> deleteJobApplicant({required int id});
  Future<Either<Failure, Unit>> deleteTrainingCenter({required int id});
  Future<Either<Failure, Unit>> deleteExpertExecutive({required int id});
  Future<Either<Failure, Unit>> deleteHotEvent({
    required DeleteHotEventParams deleteHotEventParams,
  });

  // Update
  Future<Either<Failure, JobOffer>> updateJobOffer({
    required UpdateJobOfferParams updateJobOfferParams,
  });
  Future<Either<Failure, JobApplicant>> updateJobApplicant({
    required UpdateJobApplicantParams updateJobApplicantParams,
  });
  Future<Either<Failure, TrainingCenter>> updateTrainingCenter({
    required UpdateTrainingCenterParams updateTrainingCenterParams,
  });
  Future<Either<Failure, ExpertExecutive>> updateExpertExecutive({
    required UpdateExpertExecutiveParams updateExpertExecutiveParams,
  });
  Future<Either<Failure, HotEvent>> updateHotEvent({
    required UpdateHotEventParams updateHotEventParams,
  });

  // Get all
  Future<Either<Failure, List<JobOffer>>> getAllJobOffers({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<JobApplicant>>> getAllJobApplicants({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<TrainingCenter>>> getAllTrainingCenters({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<HotEvent>>> getAllHots({
    required QueryPageParams queryPageParams,
  });
  Future<Either<Failure, List<HotEvent>>> getAllEvents({
    required QueryPageParams queryPageParams,
  });

  // Get list of candidates
  Future<Either<Failure, List<User>>> getAllCandidates({
    required GetCandidatesParams getCandidatesParams,
  });

  Future<Either<Failure, User>> getCandidate({
    required GetCandidateParams getCandidateParams,
  });

  Future<Either<Failure, JobApplicant>> prolongerJobApplicant({
    required ProlongerJobApplicantParams prolongerJobApplicantParams,
  });
}
