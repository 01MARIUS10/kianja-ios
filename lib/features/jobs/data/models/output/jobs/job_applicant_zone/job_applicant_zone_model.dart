import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_applicant/job_applicant_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';

part 'job_applicant_zone_model.freezed.dart';
part 'job_applicant_zone_model.g.dart';

@freezed
abstract class JobApplicantZoneModel
    with _$JobApplicantZoneModel
    implements JobApplicantZone {
  const factory JobApplicantZoneModel({
    @JsonKey(defaultValue: '') required String query,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(name: 'data', defaultValue: [])
    required List<JobApplicantModel> jobApplicants,
  }) = _JobApplicantZoneModel;

  const JobApplicantZoneModel._();

  factory JobApplicantZoneModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantZoneModelFromJson(json);
}
