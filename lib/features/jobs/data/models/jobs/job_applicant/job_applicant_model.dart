import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

part 'job_applicant_model.freezed.dart';
part 'job_applicant_model.g.dart';

@freezed
abstract class JobApplicantModel
    with _$JobApplicantModel
    implements JobApplicant {
  const factory JobApplicantModel({
    required int id,
    required int userId,
    required String userFirstName,
    required String userLastName,
    required String userPhoto,
    required String title,
    required String motivation,
    required List<String> categories,
    required String location,
    required String gender,
    required String pdfUrl,
    required String createdAt,
  }) = _JobApplicantModel;

  const JobApplicantModel._();

  factory JobApplicantModel.fromJson(Map<String, dynamic> json) =>
      _$JobApplicantModelFromJson(json);
}
