import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_expert_executive_input_model.freezed.dart';
part 'update_expert_executive_input_model.g.dart';

@freezed
abstract class UpdateExpertExecutiveInputModel
    with _$UpdateExpertExecutiveInputModel {
  const factory UpdateExpertExecutiveInputModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(name: 'firstname', defaultValue: '') required String firstName,
    @JsonKey(name: 'lastname', defaultValue: '') required String lastName,
    @JsonKey(name: 'date_of_birth', defaultValue: '')
    required String dateOfBirth,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(name: 'phone_number', defaultValue: '')
    required String phoneNumber,
    @JsonKey(defaultValue: '') required String address,
    @JsonKey(defaultValue: '') required String biography,
    @JsonKey(name: 'domain_id', defaultValue: -1) required int domainId,
    @JsonKey(name: 'cv_pdf_id', defaultValue: -1) required int cvPdfId,
  }) = _UpdateExpertExecutiveInputModel;

  const UpdateExpertExecutiveInputModel._();

  factory UpdateExpertExecutiveInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateExpertExecutiveInputModelFromJson(json);
}
