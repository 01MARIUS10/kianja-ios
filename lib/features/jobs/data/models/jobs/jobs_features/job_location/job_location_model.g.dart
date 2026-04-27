// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobLocationModel _$JobLocationModelFromJson(Map<String, dynamic> json) =>
    _JobLocationModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobLocationModelToJson(_JobLocationModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.name};
