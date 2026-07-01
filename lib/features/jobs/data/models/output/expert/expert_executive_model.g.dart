// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expert_executive_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExpertExecutiveModel _$ExpertExecutiveModelFromJson(
  Map<String, dynamic> json,
) => _ExpertExecutiveModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  firstName: json['firstname'] as String? ?? '',
  lastName: json['lastname'] as String? ?? '',
  dateOfBirth: json['date_of_birth'] as String? ?? '',
  email: json['email'] as String? ?? '',
  phoneNumber: json['phone_number'] as String? ?? '',
  address: json['address'] as String? ?? '',
  biography: json['biography'] as String? ?? '',
  domain: JobDomainModel.fromJson(json['domain'] as Map<String, dynamic>),
  pdfUrl: json['cv_pdf_url'] as String? ?? '',
);

Map<String, dynamic> _$ExpertExecutiveModelToJson(
  _ExpertExecutiveModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'firstname': instance.firstName,
  'lastname': instance.lastName,
  'date_of_birth': instance.dateOfBirth,
  'email': instance.email,
  'phone_number': instance.phoneNumber,
  'address': instance.address,
  'biography': instance.biography,
  'domain': instance.domain,
  'cv_pdf_url': instance.pdfUrl,
};
