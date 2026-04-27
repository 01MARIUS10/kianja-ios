// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobImageModel _$JobImageModelFromJson(Map<String, dynamic> json) =>
    _JobImageModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      url: json['url'] as String? ?? '',
      urlMin: json['url_min'] as String? ?? '',
    );

Map<String, dynamic> _$JobImageModelToJson(_JobImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'url_min': instance.urlMin,
    };
