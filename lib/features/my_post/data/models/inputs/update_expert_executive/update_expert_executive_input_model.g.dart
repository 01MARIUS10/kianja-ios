// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_expert_executive_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateExpertExecutiveInputModel _$UpdateExpertExecutiveInputModelFromJson(
  Map<String, dynamic> json,
) => _UpdateExpertExecutiveInputModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
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

Map<String, dynamic> _$UpdateExpertExecutiveInputModelToJson(
  _UpdateExpertExecutiveInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
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
