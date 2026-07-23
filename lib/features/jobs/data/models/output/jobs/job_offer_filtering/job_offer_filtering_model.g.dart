// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_filtering_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobOfferFilteringModel _$JobOfferFilteringModelFromJson(
  Map<String, dynamic> json,
) => _JobOfferFilteringModel(
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => JobCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  locations:
      (json['locations'] as List<dynamic>?)
          ?.map((e) => JobLocationModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$JobOfferFilteringModelToJson(
  _JobOfferFilteringModel instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'locations': instance.locations,
};
