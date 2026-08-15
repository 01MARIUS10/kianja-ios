// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_job_offer_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateJobOfferInputModel _$UpdateJobOfferInputModelFromJson(
  Map<String, dynamic> json,
) => _UpdateJobOfferInputModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  imageId: (json['image_id'] as num?)?.toInt(),
  imageIds: (json['imageIds'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  categories:
      (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  locations:
      (json['locationsIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  genderId: (json['genderId'] as num?)?.toInt() ?? -1,
  actorId: (json['actorId'] as num?)?.toInt() ?? -1,
  showButton: json['showButton'] as bool? ?? false,
  limitDate: json['date_limit'] as String? ?? '',
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$UpdateJobOfferInputModelToJson(
  _UpdateJobOfferInputModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'image_id': instance.imageId,
  'imageIds': instance.imageIds,
  'categoryIds': instance.categories,
  'locationsIds': instance.locations,
  'genderId': instance.genderId,
  'actorId': instance.actorId,
  'showButton': instance.showButton,
  'date_limit': instance.limitDate,
  'status': instance.status,
};
