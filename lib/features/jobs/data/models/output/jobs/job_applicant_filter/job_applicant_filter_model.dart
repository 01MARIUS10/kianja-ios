import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';

part 'job_applicant_filter_model.freezed.dart';
part 'job_applicant_filter_model.g.dart';

@freezed
abstract class JobApplicantFilterModel
    with _$JobApplicantFilterModel
    implements JobApplicantFilter {
  const factory JobApplicantFilterModel({
    @JsonKey(defaultValue: []) required List<JobCategoryModel> categories,
    @JsonKey(defaultValue: []) required List<JobLocationModel> locations,
  }) = _JobApplicantFilterModel;

  const JobApplicantFilterModel._();

  factory JobApplicantFilterModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantFilterModelFromJson(json);
}
