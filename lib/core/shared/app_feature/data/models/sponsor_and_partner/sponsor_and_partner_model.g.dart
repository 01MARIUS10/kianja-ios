// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_and_partner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SponsorAndPartnerModel _$SponsorAndPartnerModelFromJson(
  Map<String, dynamic> json,
) => _SponsorAndPartnerModel(
  sponsor: json['sponsor'] == null
      ? null
      : SponsorModel.fromJson(json['sponsor'] as Map<String, dynamic>),
  partner: json['partenaire'] == null
      ? null
      : PartnerModel.fromJson(json['partenaire'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SponsorAndPartnerModelToJson(
  _SponsorAndPartnerModel instance,
) => <String, dynamic>{
  'sponsor': instance.sponsor,
  'partenaire': instance.partner,
};
