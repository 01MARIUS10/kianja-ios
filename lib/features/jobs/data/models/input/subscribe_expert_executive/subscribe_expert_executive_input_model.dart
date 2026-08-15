import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscribe_expert_executive_input_model.freezed.dart';
part 'subscribe_expert_executive_input_model.g.dart';

@freezed
abstract class SubscribeExpertExecutiveInputModel
    with _$SubscribeExpertExecutiveInputModel {
  const factory SubscribeExpertExecutiveInputModel({
    @JsonKey(name: 'firstname', defaultValue: '') required String firstName,
    @JsonKey(name: 'lastname', defaultValue: '') required String lastName,
    @JsonKey(name: 'date_of_birth', defaultValue: '')
    required String dateOfBirth,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(name: 'phone_number', defaultValue: '')
    required String phoneNumber,
    @JsonKey(defaultValue: '') required String address,
    @JsonKey(name: 'image_path', defaultValue: '') String? photoUrl,
    @JsonKey(defaultValue: '') required String biography,
    @JsonKey(name: 'domain_id', defaultValue: -1) required int domainId,
    @JsonKey(name: 'cv_pdf_id', defaultValue: -1) required int cvPdfId,
  }) = _SubscribeExpertExecutiveInputModel;

  const SubscribeExpertExecutiveInputModel._();

  factory SubscribeExpertExecutiveInputModel.fromJson(
    Map<String, dynamic> json,
  ) => _$SubscribeExpertExecutiveInputModelFromJson(json);
}
