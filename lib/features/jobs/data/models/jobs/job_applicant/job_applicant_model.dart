import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
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
    @JsonKey(defaultValue: '') required String location,
    @JsonKey(defaultValue: '') required String gender,
    @JsonKey(name: 'pdf_url', defaultValue: '') required String pdfUrl,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'categories') required List<String> categories,
  }) = _JobApplicantModel;

  const JobApplicantModel._();

  factory JobApplicantModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantModelFromJson(json);
}
