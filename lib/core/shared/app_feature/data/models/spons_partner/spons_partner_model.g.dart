// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spons_partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsPartnerModel _$SponsPartnerModelFromJson(Map<String, dynamic> json) =>
    _SponsPartnerModel(
      title: json['titre'] as String? ?? '',
      image: json['image'] as String? ?? '',
      pageUrl: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$SponsPartnerModelToJson(_SponsPartnerModel instance) =>
    <String, dynamic>{
      'titre': instance.title,
      'image': instance.image,
      'url': instance.pageUrl,
    };
