// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_expert_executive_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscribeExpertExecutiveInputModel
_$SubscribeExpertExecutiveInputModelFromJson(Map<String, dynamic> json) =>
    _SubscribeExpertExecutiveInputModel(
      firstName: json['firstname'] as String? ?? '',
      lastName: json['lastname'] as String? ?? '',
      dateOfBirth: json['date_of_birth'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      address: json['address'] as String? ?? '',
      biography: json['biography'] as String? ?? '',
      domainId: (json['domain_id'] as num?)?.toInt() ?? -1,
      cvPdfId: (json['cv_pdf_id'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$SubscribeExpertExecutiveInputModelToJson(
  _SubscribeExpertExecutiveInputModel instance,
) => <String, dynamic>{
  'firstname': instance.firstName,
  'lastname': instance.lastName,
  'date_of_birth': instance.dateOfBirth,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'address': instance.address,
  'biography': instance.biography,
  'domain_id': instance.domainId,
  'cv_pdf_id': instance.cvPdfId,
};
