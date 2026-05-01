// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_zone_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantZoneModel _$JobApplicantZoneModelFromJson(
  Map<String, dynamic> json,
) => _JobApplicantZoneModel(
  query: json['query'] as String? ?? '',
  name: json['name'] as String? ?? '',
  jobApplicants:
      (json['data'] as List<dynamic>?)
          ?.map((e) => JobApplicantModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$JobApplicantZoneModelToJson(
  _JobApplicantZoneModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'name': instance.name,
  'data': instance.jobApplicants,
};
