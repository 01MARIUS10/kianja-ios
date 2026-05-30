// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center_view_domain_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingCenterViewDomainModel _$TrainingCenterViewDomainModelFromJson(
  Map<String, dynamic> json,
) => _TrainingCenterViewDomainModel(
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

Map<String, dynamic> _$TrainingCenterViewDomainModelToJson(
  _TrainingCenterViewDomainModel instance,
) => <String, dynamic>{
  'Vip': instance.vip,
  'Premium': instance.premium,
  'Normal': instance.normal,
};
