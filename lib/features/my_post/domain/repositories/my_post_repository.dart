import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';

abstract class MyPostRepository {
  // Delete
  Future<Either<Failure, Unit>> deleteJobOffer({required int id});
  Future<Either<Failure, Unit>> deleteJobApplicant({required int id});
  Future<Either<Failure, Unit>> deleteTrainingCenter({required int id});
  Future<Either<Failure, Unit>> deleteExpertExecutive({required int id});
  // Future<Either<Failure, Unit>> deleteHot({required int id});
  // Future<Either<Failure, Unit>> deleteEvent({required int id});

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

  // Get all
  Future<Either<Failure, List<JobOffer>>> getAllJobOffers({
    required QueryPageParams queryPageParams,
  });
  // Future<Either<Failure, List<JobApplicant>>> getAllJobApplicants();
  // Future<Either<Failure, List<TrainingCenter>>> getAllTrainingCenters();
}
