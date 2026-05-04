// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobOfferFilterModel _$JobOfferFilterModelFromJson(Map<String, dynamic> json) =>
    _JobOfferFilterModel(
      query: json['query'] as String? ?? '',
      name: json['name'] as String? ?? '',
      jobOffers:
          (json['data'] as List<dynamic>?)
              ?.map((e) => JobOfferModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$JobOfferFilterModelToJson(
  _JobOfferFilterModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'name': instance.name,
  'data': instance.jobOffers,
};
