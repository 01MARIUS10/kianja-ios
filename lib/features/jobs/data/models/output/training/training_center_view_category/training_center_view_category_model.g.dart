// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center_view_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingCenterViewCategoryModel _$TrainingCenterViewCategoryModelFromJson(
  Map<String, dynamic> json,
) => _TrainingCenterViewCategoryModel(
  vip:
      (json['Vip'] as List<dynamic>?)
          ?.map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  premium:
      (json['Premium'] as List<dynamic>?)
          ?.map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
  normal:
      (json['Normal'] as List<dynamic>?)
          ?.map((e) => TrainingCenterModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$TrainingCenterViewCategoryModelToJson(
  _TrainingCenterViewCategoryModel instance,
) => <String, dynamic>{
  'Vip': instance.vip,
  'Premium': instance.premium,
  'Normal': instance.normal,
};
