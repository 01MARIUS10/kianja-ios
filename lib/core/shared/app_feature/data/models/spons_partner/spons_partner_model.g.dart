// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spons_partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsPartnerModel _$SponsPartnerModelFromJson(Map<String, dynamic> json) =>
    _SponsPartnerModel(
      title: json['titre'] as String? ?? '',
      imageUrl:
          (json['image'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [],
      pageUrl: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$SponsPartnerModelToJson(_SponsPartnerModel instance) =>
    <String, dynamic>{
      'titre': instance.title,
      'image': instance.imageUrl,
      'url': instance.pageUrl,
    };
