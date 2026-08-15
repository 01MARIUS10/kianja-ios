// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HotEventModel _$HotEventModelFromJson(Map<String, dynamic> json) =>
    _HotEventModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      endDate: json['end_date'] as String? ?? '',
      type: json['type'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      image: json['image'] == null
          ? null
          : JobImageModel.fromJson(json['image'] as Map<String, dynamic>),
      center: TrainingCenterModel.fromJson(
        json['training_center'] as Map<String, dynamic>,
      ),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$HotEventModelToJson(_HotEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'image': instance.image,
      'training_center': instance.center,
      'isFavorite': instance.isFavorite,
    };
