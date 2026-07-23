// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorModel _$SponsorModelFromJson(Map<String, dynamic> json) =>
    _SponsorModel(
      title: json['titre'] as String? ?? '',
      image: json['image'] as String? ?? '',
      pageUrl: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$SponsorModelToJson(_SponsorModel instance) =>
    <String, dynamic>{
      'titre': instance.title,
      'image': instance.image,
      'url': instance.pageUrl,
    };
