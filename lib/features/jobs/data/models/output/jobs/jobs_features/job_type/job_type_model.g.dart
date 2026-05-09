// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobTypeModel _$JobTypeModelFromJson(Map<String, dynamic> json) =>
    _JobTypeModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobTypeModelToJson(_JobTypeModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.name};
