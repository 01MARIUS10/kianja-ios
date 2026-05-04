// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobActorModel _$JobActorModelFromJson(Map<String, dynamic> json) =>
    _JobActorModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobActorModelToJson(_JobActorModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.name};
