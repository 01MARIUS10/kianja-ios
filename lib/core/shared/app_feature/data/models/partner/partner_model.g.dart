// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnerModel _$PartnerModelFromJson(Map<String, dynamic> json) =>
    _PartnerModel(
      title: json['titre'] as String? ?? '',
      image: json['image'] as String? ?? '',
      pageUrl: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$PartnerModelToJson(_PartnerModel instance) =>
    <String, dynamic>{
      'titre': instance.title,
      'image': instance.image,
      'url': instance.pageUrl,
    };
