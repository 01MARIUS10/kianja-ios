// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantPlanModel _$JobApplicantPlanModelFromJson(
  Map<String, dynamic> json,
) => _JobApplicantPlanModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  price: (json['price'] as num?)?.toInt() ?? 0,
  type: JobTypeModel.fromJson(json['type'] as Map<String, dynamic>),
  duration: JobDurationModel.fromJson(json['duration'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JobApplicantPlanModelToJson(
  _JobApplicantPlanModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'price': instance.price,
  'type': instance.type,
  'duration': instance.duration,
};
