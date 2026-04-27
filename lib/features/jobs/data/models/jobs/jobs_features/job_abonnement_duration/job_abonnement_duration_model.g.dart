// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_abonnement_duration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobAbonnementDurationModel _$JobAbonnementDurationModelFromJson(
  Map<String, dynamic> json,
) => _JobAbonnementDurationModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['nom'] as String? ?? '',
);

Map<String, dynamic> _$JobAbonnementDurationModelToJson(
  _JobAbonnementDurationModel instance,
) => <String, dynamic>{'id': instance.id, 'nom': instance.name};
