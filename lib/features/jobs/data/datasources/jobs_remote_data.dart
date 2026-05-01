import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/jobs/data/models/output/files/job_image/job_image_model.dart';
import 'package:kianja/features/jobs/data/models/output/files/pdf_image/job_pdf_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant/job_applicant_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant_zone/job_applicant_zone_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer/job_offer_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer_filter/job_offer_filter_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_features/job_features_model.dart';

abstract interface class JobsRemoteDataSource {
  Future<JobFeaturesModel> getJobFeatures();
  Future<List<JobOfferFilterModel>> getJobOffersGroupBy({
    required String query,
  });
  Future<List<JobApplicantZoneModel>> getJobApplicantsZone();
  Future<List<JobOfferModel>> viewAllJobOffers({required String query});
  Future<List<JobApplicantModel>> viewAllJobApplicants({required String query});
  Future<JobImageModel> uploadJobImage({required XFile file});
  Future<JobPdfModel> uploadJobPdf({required PlatformFile file});
  Future<JobOfferModel> createJobOffer({
    required String title,
    required int imageId,
    required String description,
    required List<int> categories,
    required int location,
    required int gender,
    required int actor,
    required String limitDate,
    required String status,
  });
  Future<JobOfferModel> getJobOfferDetail({required int id});
  Future<JobApplicantModel> getJobApplicantDetail({required int id});
}

class JobsRemoteDataSourceImpl implements JobsRemoteDataSource {
  const JobsRemoteDataSourceImpl({required this.dio});
  final Dio dio;

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
  Future<List<JobOfferModel>> viewAllJobOffers({required String query}) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-offers?$query');
      final result = jsonHandler(response.data);
      final Map<String, dynamic> contenu =
          result['Contenu'] as Map<String, dynamic>;

      return (contenu['data'] as List<dynamic>)
          .map((e) => JobOfferModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<List<JobApplicantZoneModel>> getJobApplicantsZone() async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/zone');
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
  }) async {
    return requestHandler(() async {
      final response = await dio.get('/api/job-applicants/zone?$query');
      final result = jsonHandler(response.data);
      final Map<String, dynamic> contenu =
          result['Contenu'] as Map<String, dynamic>;

      return (contenu['data'] as List<dynamic>)
          .map((e) => JobApplicantModel.fromJson(e as Map<String, dynamic>))
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
    required String title,
    required int imageId,
    required String description,
    required List<int> categories,
    required int location,
    required int gender,
    required int actor,
    required String limitDate,
    required String status,
  }) async {
    return requestHandler(() async {
      AppDebug.showPrint('title $title');
      AppDebug.showPrint('description $description');
      AppDebug.showPrint('limitDate $limitDate');
      AppDebug.showPrint('categories $categories');
      AppDebug.showPrint('location $location');
      AppDebug.showPrint('gender $gender');
      AppDebug.showPrint('actor $actor');
      AppDebug.showPrint('imageId $imageId');
      final response = await dio.post(
        '/api/job-offers',
        data: {
          'title': title,
          'image_id': imageId,
          'description': description,
          'categoriesIds': categories,
          'locationId': location,
          'genderId': gender,
          'actorId': actor,
          'date_limit': limitDate,
          'status': status,
        },
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      return JobOfferModel.fromJson(result);
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
