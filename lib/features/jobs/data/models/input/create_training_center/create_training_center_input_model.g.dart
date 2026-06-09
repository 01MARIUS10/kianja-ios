// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_training_center_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTrainingCenterInputModel _$CreateTrainingCenterInputModelFromJson(
  Map<String, dynamic> json,
) => _CreateTrainingCenterInputModel(
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
  locationId: (json['locationId'] as num?)?.toInt() ?? -1,
  imageIds: (json['image_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  domainIds:
      (json['domainIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  actorId: (json['actorId'] as num?)?.toInt() ?? -1,
  typeId: (json['typeId'] as num?)?.toInt() ?? -1,
  tagId: (json['tagId'] as num?)?.toInt() ?? -1,
  durationId: (json['durationId'] as num?)?.toInt() ?? -1,
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$CreateTrainingCenterInputModelToJson(
  _CreateTrainingCenterInputModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'locationId': instance.locationId,
  'image_ids': instance.imageIds,
  'domainIds': instance.domainIds,
  'actorId': instance.actorId,
  'typeId': instance.typeId,
  'tagId': instance.tagId,
  'durationId': instance.durationId,
  'status': instance.status,
};
