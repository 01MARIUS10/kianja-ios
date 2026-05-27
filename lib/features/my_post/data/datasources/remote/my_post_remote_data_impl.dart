import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/features/jobs/data/models/output/expert/expert_executive_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant/job_applicant_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer/job_offer_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/my_post/data/datasources/remote/my_post_remote_data.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_expert_executive/update_expert_executive_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_applicant/update_job_applicant_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_job_offer/update_job_offer_input_model.dart';
import 'package:kianja/features/my_post/data/models/inputs/update_training_center/update_training_center_input_model.dart';

class MyPostRemoteDataImpl implements MyPostRemoteData {
  const MyPostRemoteDataImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> deleteJobOffer({required int id}) async {
    return requestHandler(() async {
      await dio.delete('/api/job-offers/$id');
    });
  }

  @override
  Future<void> deleteJobApplicant({required int id}) async {
    return requestHandler(() async {
      await dio.delete('/api/job-applicants/$id');
    });
  }

  @override
  Future<void> deleteTrainingCenter({required int id}) async {
    return requestHandler(() async {
      await dio.delete('/api/training-centers/$id');
    });
  }

  @override
  Future<void> deleteExpertExecutive({required int id}) async {
    return requestHandler(() async {
      await dio.delete('/api/expert-cadres/$id');
    });
  }

  @override
  Future<JobOfferModel> updateJobOffer({
    required UpdateJobOfferInputModel updateJobOfferInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.put(
        '/api/job-offers/${updateJobOfferInputModel.id}',
        data: updateJobOfferInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobOfferModel.fromJson(result);
    });
  }

  @override
  Future<JobApplicantModel> updateJobApplicant({
    required UpdateJobApplicantInputModel updateJobApplicantInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.put(
        '/api/job-applicants/${updateJobApplicantInputModel.id}',
        data: updateJobApplicantInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobApplicantModel.fromJson(result);
    });
  }

  @override
  Future<TrainingCenterModel> updateTrainingCenter({
    required UpdateTrainingCenterInputModel updateTrainingCenterInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.put(
        '/api/training-centers/${updateTrainingCenterInputModel.id}',
        data: updateTrainingCenterInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return TrainingCenterModel.fromJson(result);
    });
  }

  @override
  Future<ExpertExecutiveModel> updateExpertExecutive({
    required UpdateExpertExecutiveInputModel updateExpertExecutiveInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.put(
        '/api/expert-cadres/${updateExpertExecutiveInputModel.id}',
        data: updateExpertExecutiveInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return ExpertExecutiveModel.fromJson(result);
    });
  }

  @override
  Future<List<JobOfferModel>> getAllJobOffers({required int page}) {
    return requestHandler(() async {
      final response = await dio.get('/api/mesAnnonces/jobOffers?page=$page');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> content = result['Contenu'];
      final Map<String, dynamic> jobOffers = content['jobOffers'];
      final List<dynamic> jobOfferList = jobOffers['data'];
      return jobOfferList
          .map((jobOffer) => JobOfferModel.fromJson(jobOffer))
          .toList();
    });
  }

  @override
  Future<List<JobApplicantModel>> getAllJobApplicants({required int page}) {
    return requestHandler(() async {
      final response =
          await dio.get('/api/mesAnnonces/jobApplicants?page=$page');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> content = result['Contenu'];
      final Map<String, dynamic> jobApplicants = content['jobApplicants'];
      final List<dynamic> jobApplicantList = jobApplicants['data'];
      return jobApplicantList
          .map(
            (jobApplicant) => JobApplicantModel.fromJson(
              jobApplicant as Map<String, dynamic>,
            ),
          )
          .toList();
    });
  }

  @override
  Future<List<TrainingCenterModel>> getAllTrainingCenters({required int page}) {
    return requestHandler(() async {
      final response =
          await dio.get('/api/mesAnnonces/trainingCenters?page=$page');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> content = result['Contenu'];
      final Map<String, dynamic> trainingCenters = content['trainingCenters'];
      final List<dynamic> trainingCenterList = trainingCenters['data'];
      return trainingCenterList
          .map(
            (trainingCenter) => TrainingCenterModel.fromJson(
              trainingCenter as Map<String, dynamic>,
            ),
          )
          .toList();
    });
  }
}
