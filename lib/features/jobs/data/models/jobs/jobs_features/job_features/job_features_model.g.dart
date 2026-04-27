// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_features_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobFeaturesModel _$JobFeaturesModelFromJson(Map<String, dynamic> json) =>
    _JobFeaturesModel(
      categories:
          (json['Category'] as List<dynamic>?)
              ?.map((e) => JobCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      domains:
          (json['Domain'] as List<dynamic>?)
              ?.map((e) => JobDomainModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      locations:
          (json['Location'] as List<dynamic>?)
              ?.map((e) => JobLocationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      genders:
          (json['Gender'] as List<dynamic>?)
              ?.map((e) => JobGenderModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      actors:
          (json['Actor'] as List<dynamic>?)
              ?.map((e) => JobActorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      abonnementTypes:
          (json['AbonnementType'] as List<dynamic>?)
              ?.map(
                (e) =>
                    JobAbonnementTypeModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
      abonnementDurations:
          (json['AbonnementDuration'] as List<dynamic>?)
              ?.map(
                (e) => JobAbonnementDurationModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$JobFeaturesModelToJson(_JobFeaturesModel instance) =>
    <String, dynamic>{
      'Category': instance.categories,
      'Domain': instance.domains,
      'Location': instance.locations,
      'Gender': instance.genders,
      'Actor': instance.actors,
      'AbonnementType': instance.abonnementTypes,
      'AbonnementDuration': instance.abonnementDurations,
    };
