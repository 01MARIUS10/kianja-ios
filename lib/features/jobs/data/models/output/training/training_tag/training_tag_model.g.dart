// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingTagModel _$TrainingTagModelFromJson(Map<String, dynamic> json) =>
    _TrainingTagModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      tag: json['tag'] as String? ?? '',
    );

Map<String, dynamic> _$TrainingTagModelToJson(_TrainingTagModel instance) =>
    <String, dynamic>{'id': instance.id, 'tag': instance.tag};
