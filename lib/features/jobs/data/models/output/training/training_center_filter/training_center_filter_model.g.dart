// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingCenterFilterModel _$TrainingCenterFilterModelFromJson(
  Map<String, dynamic> json,
) => _TrainingCenterFilterModel(
  query: json['query'] as String? ?? '',
  name: json['name'] as String? ?? '',
  trainingCenters:
      (json['data'] as List<dynamic>?)
          ?.map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$TrainingCenterFilterModelToJson(
  _TrainingCenterFilterModel instance,
) => <String, dynamic>{
  'query': instance.query,
  'name': instance.name,
  'data': instance.trainingCenters,
};
