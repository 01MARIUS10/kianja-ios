// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantFilterModel _$JobApplicantFilterModelFromJson(
  Map<String, dynamic> json,
) => _JobApplicantFilterModel(
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

Map<String, dynamic> _$JobApplicantFilterModelToJson(
  _JobApplicantFilterModel instance,
) => <String, dynamic>{
  'categories': instance.categories,
  'locations': instance.locations,
};
