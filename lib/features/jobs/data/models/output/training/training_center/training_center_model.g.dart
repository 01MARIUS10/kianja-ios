// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingCenterModel _$TrainingCenterModelFromJson(Map<String, dynamic> json) =>
    _TrainingCenterModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      imageUrl: json['image_path'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] == null
          ? null
          : JobCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      actor: json['actor'] == null
          ? null
          : JobActorModel.fromJson(json['actor'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : JobLocationModel.fromJson(json['location'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$TrainingCenterModelToJson(
  _TrainingCenterModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image_path': instance.imageUrl,
  'description': instance.description,
  'category': instance.category,
  'actor': instance.actor,
  'location': instance.location,
  'user': instance.user,
  'created_at': instance.createdAt,
};
