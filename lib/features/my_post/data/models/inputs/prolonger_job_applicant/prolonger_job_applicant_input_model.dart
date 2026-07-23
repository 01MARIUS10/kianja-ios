import 'package:freezed_annotation/freezed_annotation.dart';

part 'prolonger_job_applicant_input_model.freezed.dart';
part 'prolonger_job_applicant_input_model.g.dart';

@freezed
abstract class ProlongerJobApplicantInputModel
    with _$ProlongerJobApplicantInputModel {
  const factory ProlongerJobApplicantInputModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: -1) required int typeId,
    @JsonKey(defaultValue: -1) required int durationId,
  }) = _ProlongerJobApplicantInputModel;

  const ProlongerJobApplicantInputModel._();

  factory ProlongerJobApplicantInputModel.fromJson(Map<String, dynamic> json) =>
      _$ProlongerJobApplicantInputModelFromJson(json);
}
