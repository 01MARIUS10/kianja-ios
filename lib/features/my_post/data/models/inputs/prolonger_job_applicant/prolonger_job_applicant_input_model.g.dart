// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prolonger_job_applicant_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProlongerJobApplicantInputModel _$ProlongerJobApplicantInputModelFromJson(
  Map<String, dynamic> json,
) => _ProlongerJobApplicantInputModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
);

Map<String, dynamic> _$ProlongerJobApplicantInputModelToJson(
  _ProlongerJobApplicantInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'typeId': instance.typeId,
  'durationId': instance.durationId,
};
