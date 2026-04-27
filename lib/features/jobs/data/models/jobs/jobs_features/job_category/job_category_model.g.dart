// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobCategoryModel _$JobCategoryModelFromJson(Map<String, dynamic> json) =>
    _JobCategoryModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['nom'] as String? ?? '',
    );

Map<String, dynamic> _$JobCategoryModelToJson(_JobCategoryModel instance) =>
    <String, dynamic>{'id': instance.id, 'nom': instance.name};
