// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center_hot_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingCenterHotEventModel _$TrainingCenterHotEventModelFromJson(
  Map<String, dynamic> json,
) => _TrainingCenterHotEventModel(
  query: json['query'] as String? ?? '',
  name: json['name'] as String? ?? '',
  hotEvents:
      (json['data'] as List<dynamic>?)
          ?.map((e) => HotEventModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$TrainingCenterHotEventModelToJson(
  _TrainingCenterHotEventModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'name': instance.name,
  'data': instance.hotEvents,
};
