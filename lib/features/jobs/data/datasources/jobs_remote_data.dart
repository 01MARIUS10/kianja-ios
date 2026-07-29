import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/jobs/data/mappers/training_center_badge_mapper.dart';
import 'package:kianja/features/jobs/data/models/input/create_job_applicant/create_job_applicant_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/create_job_offer/create_job_offer_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/create_training_center/create_training_center_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/hot_event/hot_event_input_model.dart';
import 'package:kianja/features/jobs/data/models/input/subscribe_expert_executive/subscribe_expert_executive_input_model.dart';
import 'package:kianja/features/jobs/data/models/output/expert/expert_executive_model.dart';
import 'package:kianja/features/jobs/data/models/output/files/job_image/job_image_model.dart';
import 'package:kianja/features/jobs/data/models/output/files/pdf_image/job_pdf_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant/job_applicant_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant_filter/job_applicant_filter_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant_zone/job_applicant_zone_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer/job_offer_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer_filter/job_offer_filter_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer_filtering/job_offer_filtering_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_domain/job_domain_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_features/job_features_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/price_plan/price_plan_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/hot_event/hot_event_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_filter/training_center_filter_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_hot_event/training_center_hot_event_model.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_view_domain/training_center_view_domain_model.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';

abstract interface class JobsRemoteDataSource {
  Future<JobFeaturesModel> getJobFeatures();
  Future<List<JobCategoryModel>> getJobApplicantProfessions();
  Future<JobApplicantFilterModel> getJobApplicantFilters();
  Future<JobOfferFilteringModel> getJobOfferFiltering();
  Future<List<JobOfferFilterModel>> getJobOffersGroupBy({
    required String query,
  });
  Future<List<JobApplicantZoneModel>> getJobApplicantsZone({
    required String query,
  });
  Future<List<JobOfferModel>> viewAllJobOffers({
    required String query,
    required int page,
  });
  Future<List<JobApplicantModel>> viewAllJobApplicants({
    required String query,
    required int page,
  });
  Future<JobImageModel> uploadJobImage({required XFile file});
  Future<JobPdfModel> uploadJobPdf({required PlatformFile file});
  Future<List<PricePlanModel>> getPricePlans({required String plan});
  Future<JobApplicantModel> createJobApplicant({
    required CreateJobApplicantInputModel createJobApplicantInputModel,
  });
  Future<JobOfferModel> createJobOffer({
    required CreateJobOfferInputModel createJobOfferInputModel,
  });
  Future<JobOfferModel> getJobOfferDetail({required int id});
  Future<String> applyToOffer({required int id});
  Future<String> saveContent({
    required SaveContentEnum saveContent,
    required int id,
  });
  Future<List<JobOfferModel>> getAllSavedJobOffers({required int page});
  Future<List<JobApplicantModel>> getAllSavedJobApplicants({required int page});
  Future<List<TrainingCenterModel>> getAllSavedTrainingCenters({
    required int page,
  });
  Future<List<HotEventModel>> getAllSavedHots({required int page});
  Future<List<HotEventModel>> getAllSavedEvents({required int page});
  Future<List<JobOfferModel>> getJobApplications({required int page});
  Future<JobApplicantModel> getJobApplicantDetail({required int id});
  Future<HotEventModel> getHotEventDetail({
    required String query,
    required int id,
  });
  Future<TrainingCenterModel> getTrainingCenterDetail({required int id});
  Future<List<JobDomainModel>> getTrainingCenterDomains();
  Future<List<TrainingCenterHotEventModel>> getTrainingCenterHotEvent();
  Future<TrainingCenterFilterModel> getTrainingCenterFilter();
  Future<List<HotEventModel>> viewAllHotEvents({required String query});
  Future<List<TrainingCenterModel>> viewAllTrainingCenters({
    required String query,
  });
  Future<TrainingCenterViewDomainModel> getTrainingCenterViewDomain({
    required int id,
  });
  Future<TrainingCenterModel> createTrainingCenter({
    required CreateTrainingCenterInputModel createTrainingCenterInputModel,
  });
  Future<ExpertExecutiveModel> subscribeExpertExecutive({
    required SubscribeExpertExecutiveInputModel
    subscribeExpertExecutiveInputModel,
  });
  Future<HotEventModel> createHotEvent({
    required HotEventInputModel hotEventInputModel,
  });
}

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  const JobsRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<HotEventModel> createHotEvent({
    required HotEventInputModel hotEventInputModel,
  }) async {
    return requestHandler(() async {
      String apiUrl = '';
      if (hotEventInputModel.type == 'hot') {
        apiUrl = '/api/training-centers/hots';
      } else {
        apiUrl = '/api/training-centers/events';
      }
      final response = await dio.post(
        apiUrl,
        data: hotEventInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return HotEventModel.fromJson(result);
    });
  }

  @override
  Future<HotEventModel> getHotEventDetail({
    required String query,
    required int id,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers$query/$id');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return HotEventModel.fromJson(result['Contenu']);
    });
  }

  @override
  Future<TrainingCenterModel> getTrainingCenterDetail({required int id}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/$id');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return TrainingCenterModel.fromJson(result['Contenu']);
    });
  }

  @override
  Future<List<TrainingCenterHotEventModel>> getTrainingCenterHotEvent() async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return (result['Contenu'] as List<dynamic>)
          .take(2)
          .map(
            (e) =>
                TrainingCenterHotEventModel.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    });
  }

  @override
  Future<TrainingCenterFilterModel> getTrainingCenterFilter() async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return TrainingCenterFilterModel.fromJson(
        (result['Contenu'] as List<dynamic>).last as Map<String, dynamic>,
      );
    });
  }

  @override
  Future<List<HotEventModel>> viewAllHotEvents({required String query}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers$query');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> contenu = result['Contenu'];
      return (contenu['data'] as List<dynamic>)
          .map((e) => HotEventModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<TrainingCenterModel>> viewAllTrainingCenters({
    required String query,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers?$query');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> contenu = result['Contenu'];
      return (contenu['data'] as List<dynamic>)
          .map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<TrainingCenterViewDomainModel> getTrainingCenterViewDomain({
    required int id,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/categories/$id');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> contenu = result['Contenu'];
      final List<TrainingCenterModel> trainingCentersVip =
          (contenu['Vip'] as List<dynamic>)
              .map(
                (e) => TrainingCenterModel.fromJson(
                  e as Map<String, dynamic>,
                ).copyWith(badge: TrainingCenterBadgeMapper.fromString('vip')),
              )
              .toList();
      final List<TrainingCenterModel> trainingCentersPremiun =
          (contenu['Premium'] as List<dynamic>)
              .map(
                (e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>)
                    .copyWith(
                      badge: TrainingCenterBadgeMapper.fromString('premium'),
                    ),
              )
              .toList();
      final Map<String, dynamic> contenuNormal = contenu['Normal'];
      final List<TrainingCenterModel> trainingCentersNormal =
          (contenuNormal['data'] as List<dynamic>)
              .map(
                (e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>)
                    .copyWith(
                      badge: TrainingCenterBadgeMapper.fromString('normal'),
                    ),
              )
              .toList();
      return TrainingCenterViewDomainModel(
        vip: trainingCentersVip,
        premium: trainingCentersPremiun,
        normal: trainingCentersNormal,
      );
    });
  }

  @override
  Future<TrainingCenterModel> createTrainingCenter({
    required CreateTrainingCenterInputModel createTrainingCenterInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/training-centers',
        data: createTrainingCenterInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return TrainingCenterModel.fromJson(result);
    });
  }

  @override
  Future<ExpertExecutiveModel> subscribeExpertExecutive({
    required SubscribeExpertExecutiveInputModel
    subscribeExpertExecutiveInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/expert-cadres',
        data: subscribeExpertExecutiveInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return ExpertExecutiveModel.fromJson(result);
    });
  }

  @override
  Future<JobFeaturesModel> getJobFeatures() async {
    return requestHandler(() async {
      final response = await dio.get(
        '/api/documentation/customList?Category=1&Location=1&Gender=1&Actor=1&Domain=1&AbonnementType=1&AbonnementDuration=1',
      );
      final List<dynamic> result = response.data;
      return JobFeaturesModel.fromJson(result.first);
    });
  }

  @override
  Future<List<JobCategoryModel>> getJobApplicantProfessions() async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/proffessions');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> content = result['Contenu'];
      return (content['categories'] as List<dynamic>)
          .map((e) => JobCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<JobApplicantFilterModel> getJobApplicantFilters() async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/filtres');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobApplicantFilterModel.fromJson(result['Contenu']);
    });
  }

  @override
  Future<JobOfferFilteringModel> getJobOfferFiltering() async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers/filtres');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobOfferFilteringModel.fromJson(result['Contenu']);
    });
  }

  @override
  Future<List<JobOfferFilterModel>> getJobOffersGroupBy({
    required String query,
  }) async {
    AppDebug.showPrint('GroupBy: $query');

    return requestHandler(() async {
      final response = await dio.get(
        '/api/job-offers',
        queryParameters: {'groupBy': query},
      );
      final result = jsonHandler(response.data);
      return (result['Contenu'] as List<dynamic>)
          .map((e) => JobOfferFilterModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobOfferModel>> viewAllJobOffers({
    required String query,
    required int page,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers?$query&page=$page');
      final result = jsonHandler(response.data);
      final Map<String, dynamic> contenu =
          result['Contenu'] as Map<String, dynamic>;

      return (contenu['data'] as List<dynamic>)
          .map((e) => JobOfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobApplicantZoneModel>> getJobApplicantsZone({
    required String query,
  }) async {
    return requestHandler(() async {
      final response = await dio.get(
        '/api/job-applicants',
        queryParameters: {'groupBy': query},
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint(result['Contenu'].toString());
      return (result['Contenu'] as List<dynamic>)
          .map((e) => JobApplicantZoneModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobApplicantModel>> viewAllJobApplicants({
    required String query,
    required int page,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants?$query&page=$page');
      final result = jsonHandler(response.data);
      final Map<String, dynamic> contenu =
          result['Contenu'] as Map<String, dynamic>;

      return (contenu['data'] as List<dynamic>)
          .map((e) => JobApplicantModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobDomainModel>> getTrainingCenterDomains() async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/categories');
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> content = result['Contenu'];
      return (content['categories'] as List<dynamic>)
          .map((e) => JobDomainModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<JobImageModel> uploadJobImage({required XFile file}) async {
    return requestHandler(() async {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(file.path, filename: file.name),
      });
      AppDebug.showPrint('photo name ${file.name}');
      AppDebug.showPrint('photo path ${file.path}');
      final response = await dio.post(
        '/api/image/upload',
        data: formData,
        onSendProgress: (sent, total) {
          AppDebug.showPrint('${(sent / total * 100).toStringAsFixed(0)}%');
        },
      );
      AppDebug.showPrint(response.data.toString());
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      return JobImageModel.fromJson(result['image'] as Map<String, dynamic>);
    });
  }

  @override
  Future<JobPdfModel> uploadJobPdf({required PlatformFile file}) async {
    return requestHandler(() async {
      final formData = FormData.fromMap({
        'pdf': await MultipartFile.fromFile(file.path!, filename: file.name),
      });
      AppDebug.showPrint('pdf name ${file.name}');
      AppDebug.showPrint('pdf path ${file.path}');
      final response = await dio.post(
        '/api/pdf/upload',
        data: formData,
        onSendProgress: (sent, total) {
          AppDebug.showPrint('${(sent / total * 100).toStringAsFixed(0)}%');
        },
      );
      AppDebug.showPrint(response.data.toString());
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      return JobPdfModel.fromJson(result['pdf'] as Map<String, dynamic>);
    });
  }

  @override
  Future<JobOfferModel> createJobOffer({
    required CreateJobOfferInputModel createJobOfferInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/job-offers',
        data: createJobOfferInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobOfferModel.fromJson(result);
    });
  }

  @override
  Future<List<PricePlanModel>> getPricePlans({required String plan}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/plans/$plan');
      final result = jsonSimpleDecode(response.data);
      final List<dynamic> plans = result['data'] ?? [];
      return plans
          .map((e) => PricePlanModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<JobApplicantModel> createJobApplicant({
    required CreateJobApplicantInputModel createJobApplicantInputModel,
  }) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/job-applicants',
        data: createJobApplicantInputModel.toJson(),
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobApplicantModel.fromJson(result);
    });
  }

  @override
  Future<JobOfferModel> getJobOfferDetail({required int id}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers/$id');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobOfferModel.fromJson(result['Contenu'] as Map<String, dynamic>);
    });
  }

  @override
  Future<String> applyToOffer({required int id}) async {
    return requestHandler(() async {
      final response = await dio.post('/api/job-offers/$id/postuler');
      AppDebug.showPrint('applyToOffer response: $response');

      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      // if (result['data'] == null && result['statusCode'] == 200) {
      //   return result['message'] as String;
      // }
      AppDebug.showPrint('applyToOffer result: $result');
      return result['message'] as String;
    });
  }

  @override
  Future<String> saveContent({
    required SaveContentEnum saveContent,
    required int id,
  }) async {
    return requestHandler(() async {
      final type = saveContent.type;
      final response = await dio.post('/api/$type/$id/favoris');
      AppDebug.showPrint('saveContent response: $response');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('saveContent result: $result');
      return result['message'] as String;
    });
  }

  @override
  Future<List<JobOfferModel>> getAllSavedJobOffers({required int page}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers/favoris');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('getAllSavedJobOffers result: $result');
      return (result['data'] as List<dynamic>)
          .map((e) => JobOfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobApplicantModel>> getAllSavedJobApplicants({
    required int page,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/favoris');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('getAllSavedJobApplicants result: $result');
      return (result['data'] as List<dynamic>)
          .map((e) => JobApplicantModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<TrainingCenterModel>> getAllSavedTrainingCenters({
    required int page,
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/favoris');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('getAllSavedTrainingCenters result: $result');
      return (result['data'] as List<dynamic>)
          .map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<HotEventModel>> getAllSavedHots({required int page}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/hots/favoris');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('getAllSavedHots result: $result');
      return (result['data'] as List<dynamic>)
          .map((e) => HotEventModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<HotEventModel>> getAllSavedEvents({required int page}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/training-centers/events/favoris');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      AppDebug.showPrint('getAllSavedEvents result: $result');
      return (result['data'] as List<dynamic>)
          .map((e) => HotEventModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobOfferModel>> getJobApplications({required int page}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers/candidatures');
      final Map<String, dynamic> result = jsonSimpleDecode(response.data);
      return (result['data'] as List<dynamic>)
          .map((e) => JobOfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<JobApplicantModel> getJobApplicantDetail({required int id}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/$id');
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobApplicantModel.fromJson(
        result['Contenu'] as Map<String, dynamic>,
      );
    });
  }
}
