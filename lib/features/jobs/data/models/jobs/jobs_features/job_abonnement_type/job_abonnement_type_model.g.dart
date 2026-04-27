// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_abonnement_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobAbonnementTypeModel _$JobAbonnementTypeModelFromJson(
  Map<String, dynamic> json,
) => _JobAbonnementTypeModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['nom'] as String? ?? '',
);

Map<String, dynamic> _$JobAbonnementTypeModelToJson(
  _JobAbonnementTypeModel instance,
) => <String, dynamic>{'id': instance.id, 'nom': instance.name};
