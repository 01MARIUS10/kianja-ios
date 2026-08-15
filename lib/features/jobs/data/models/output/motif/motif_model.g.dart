// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motif_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MotifModel _$MotifModelFromJson(Map<String, dynamic> json) => _MotifModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  libelle: json['libelle'] as String? ?? '',
);

Map<String, dynamic> _$MotifModelToJson(_MotifModel instance) =>
    <String, dynamic>{'id': instance.id, 'libelle': instance.libelle};
