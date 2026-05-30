// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobDomainModel _$JobDomainModelFromJson(Map<String, dynamic> json) =>
    _JobDomainModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$JobDomainModelToJson(_JobDomainModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nom': instance.name,
      'icon': instance.icon,
    };
