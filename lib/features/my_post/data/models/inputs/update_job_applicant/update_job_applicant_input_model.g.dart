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
  photoUrl: json['photo_candidat'] as String? ?? '',
  pdfUrl: json['resumepdf_path'] as String? ?? '',
  categories:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  locations:
      (json['locationsIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  genderId: (json['genderId'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$UpdateJobApplicantInputModelToJson(
  _UpdateJobApplicantInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'motivation': instance.motivation,
  'photo_candidat': instance.photoUrl,
  'resumepdf_path': instance.pdfUrl,
  'categoryIds': instance.categories,
  'locationsIds': instance.locations,
  'genderId': instance.genderId,
  'typeId': instance.typeId,
  'durationId': instance.durationId,
  'status': instance.status,
};
