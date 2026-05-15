// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_name_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingNameModel _$TrainingNameModelFromJson(Map<String, dynamic> json) =>
    _TrainingNameModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$TrainingNameModelToJson(_TrainingNameModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
