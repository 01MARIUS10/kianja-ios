import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_job_applicant_input_model.freezed.dart';
part 'update_job_applicant_input_model.g.dart';

@freezed
abstract class UpdateJobApplicantInputModel
    with _$UpdateJobApplicantInputModel {
  const factory UpdateJobApplicantInputModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'motivation', defaultValue: '') required String motivation,
    @JsonKey(name: 'resumepdf_path', defaultValue: '') String? pdfUrl,
    @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(defaultValue: -1) required int genderId,
    @JsonKey(defaultValue: -1) required int typeId,
    @JsonKey(defaultValue: -1) required int durationId,
    @JsonKey(defaultValue: -1) required int categoryId,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _UpdateJobApplicantInputModel;

  const UpdateJobApplicantInputModel._();

  factory UpdateJobApplicantInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobApplicantInputModelFromJson(json);
}
