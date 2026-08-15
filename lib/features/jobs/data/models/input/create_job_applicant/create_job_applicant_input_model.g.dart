// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_applicant_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateJobApplicantInputModel _$CreateJobApplicantInputModelFromJson(
  Map<String, dynamic> json,
) => _CreateJobApplicantInputModel(
  title: json['title'] as String? ?? '',
  motivation: json['motivation'] as String? ?? '',
  photoUrl: json['photo_candidat'] as String?,
  pdfUrl: json['resumepdf_path'] as String?,
  genderId: (json['genderId'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
  categories:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  locationIds:
      (json['locationIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$CreateJobApplicantInputModelToJson(
  _CreateJobApplicantInputModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'motivation': instance.motivation,
  'photo_candidat': instance.photoUrl,
  'resumepdf_path': instance.pdfUrl,
  'genderId': instance.genderId,
  'typeId': instance.typeId,
  'durationId': instance.durationId,
  'categoryIds': instance.categories,
  'locationIds': instance.locationIds,
  'status': instance.status,
};
