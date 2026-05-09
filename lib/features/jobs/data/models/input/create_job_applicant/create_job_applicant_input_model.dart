import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_applicant_input_model.freezed.dart';
part 'create_job_applicant_input_model.g.dart';

@freezed
abstract class CreateJobApplicantInputModel
    with _$CreateJobApplicantInputModel {
  const factory CreateJobApplicantInputModel({
    @JsonKey(name: 'title', defaultValue: '') required String title,
    @JsonKey(name: 'motivation', defaultValue: '') required String motivation,
    @JsonKey(name: 'image_path', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'resumepdf_path', defaultValue: '') required String pdfUrl,
    @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(defaultValue: -1) required int genderId,
    @JsonKey(defaultValue: -1) required int typeId,
    @JsonKey(defaultValue: -1) required int durationId,
    @JsonKey(defaultValue: -1) required int categoryId,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _CreateJobApplicantInputModel;

  const CreateJobApplicantInputModel._();

  factory CreateJobApplicantInputModel.fromJson(Map<String, dynamic> json) =>
      _$CreateJobApplicantInputModelFromJson(json);
}
