// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_training_center_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTrainingCenterInputModel _$UpdateTrainingCenterInputModelFromJson(
  Map<String, dynamic> json,
) => _UpdateTrainingCenterInputModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  locationId: (json['locationId'] as num?)?.toInt() ?? -1,
  imageIds:
      (json['image_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  actorId: (json['actorId'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  tagId: (json['tagId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$UpdateTrainingCenterInputModelToJson(
  _UpdateTrainingCenterInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'locationId': instance.locationId,
  'image_ids': instance.imageIds,
  'actorId': instance.actorId,
  'typeId': instance.typeId,
  'tagId': instance.tagId,
  'durationId': instance.durationId,
  'status': instance.status,
};
