import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_duration/job_duration_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_type/job_type_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_plan.dart';

part 'job_applicant_plan_model.freezed.dart';
part 'job_applicant_plan_model.g.dart';

@freezed
abstract class JobApplicantPlanModel
    with _$JobApplicantPlanModel
    implements JobApplicantPlan {
  const factory JobApplicantPlanModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: 0) required int price,
    required JobTypeModel type,
    required JobDurationModel duration,
  }) = _JobApplicantPlanModel;

  const JobApplicantPlanModel._();

  factory JobApplicantPlanModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantPlanModelFromJson(json);
}
