// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_event_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotEventInputModel _$HotEventInputModelFromJson(Map<String, dynamic> json) =>
    _HotEventInputModel(
      trainingCenterId: (json['training_center_id'] as num?)?.toInt() ?? -1,
      id: (json['id'] as num?)?.toInt() ?? -1,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageId: (json['image_id'] as num?)?.toInt(),
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
    );

Map<String, dynamic> _$HotEventInputModelToJson(_HotEventInputModel instance) =>
    <String, dynamic>{
      'training_center_id': instance.trainingCenterId,
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'image_id': instance.imageId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };
