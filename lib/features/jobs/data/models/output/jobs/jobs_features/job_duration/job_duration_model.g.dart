// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_duration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobDurationModel _$JobDurationModelFromJson(Map<String, dynamic> json) =>
    _JobDurationModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      duration: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobDurationModelToJson(_JobDurationModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.duration};
