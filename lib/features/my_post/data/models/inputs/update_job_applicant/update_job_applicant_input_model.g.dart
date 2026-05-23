// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_job_applicant_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateJobApplicantInputModel _$UpdateJobApplicantInputModelFromJson(
  Map<String, dynamic> json,
) => _UpdateJobApplicantInputModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  title: json['title'] as String? ?? '',
  motivation: json['motivation'] as String? ?? '',
  imageUrl: json['image_path'] as String? ?? '',
  pdfUrl: json['resumepdf_path'] as String? ?? '',
  locationId: (json['locationId'] as num?)?.toInt() ?? -1,
  genderId: (json['genderId'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
  categoryId: (json['categoryId'] as num?)?.toInt() ?? -1,
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$UpdateJobApplicantInputModelToJson(
  _UpdateJobApplicantInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'motivation': instance.motivation,
  'image_path': instance.imageUrl,
  'resumepdf_path': instance.pdfUrl,
  'locationId': instance.locationId,
  'genderId': instance.genderId,
  'typeId': instance.typeId,
  'durationId': instance.durationId,
  'categoryId': instance.categoryId,
  'status': instance.status,
};
