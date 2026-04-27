// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobPdfModel _$JobPdfModelFromJson(Map<String, dynamic> json) => _JobPdfModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  name: json['name'] as String? ?? '',
  url: json['url'] as String? ?? '',
);

Map<String, dynamic> _$JobPdfModelToJson(_JobPdfModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
    };
