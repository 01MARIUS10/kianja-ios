import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_gender/job_gender_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

part 'job_applicant_model.freezed.dart';
part 'job_applicant_model.g.dart';

@freezed
abstract class JobApplicantModel
    with _$JobApplicantModel
    implements JobApplicant {
  const factory JobApplicantModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String motivation,
    @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])
    required List<JobCategoryModel> categories,
    @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])
    required List<JobLocationModel> locations,
    // required JobLocationModel location,
    JobGenderModel? gender,
    @JsonKey(name: 'photo_candidat') String? photoUrl,
    @JsonKey(name: 'resumepdf_path') String? pdfUrl,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
    required UserModel user,
    // JobCategoryModel? category,
    @JsonKey(defaultValue: false) required bool isFavorite,
  }) = _JobApplicantModel;

  const JobApplicantModel._();

  factory JobApplicantModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantModelFromJson(json);
}
