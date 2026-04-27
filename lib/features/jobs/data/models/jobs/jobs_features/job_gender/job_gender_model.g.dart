// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_gender_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobGenderModel _$JobGenderModelFromJson(Map<String, dynamic> json) =>
    _JobGenderModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobGenderModelToJson(_JobGenderModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.name};
