// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_job_offer_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateJobOfferInputModel _$CreateJobOfferInputModelFromJson(
  Map<String, dynamic> json,
) => _CreateJobOfferInputModel(
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
  locationIds:
      (json['locationIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      [],
  genderId: (json['genderId'] as num?)?.toInt() ?? -1,
  actorId: (json['actorId'] as num?)?.toInt() ?? -1,
  showButton: json['showButton'] as bool? ?? false,
  limitDate: json['date_limit'] as String? ?? '',
  status: json['status'] as String? ?? 'published',
);

Map<String, dynamic> _$CreateJobOfferInputModelToJson(
  _CreateJobOfferInputModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'image_id': instance.imageId,
  'imageIds': instance.imageIds,
  'categoryIds': instance.categories,
  'locationIds': instance.locationIds,
  'genderId': instance.genderId,
  'actorId': instance.actorId,
  'showButton': instance.showButton,
  'date_limit': instance.limitDate,
  'status': instance.status,
};
