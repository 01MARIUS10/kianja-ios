// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobOfferModel _$JobOfferModelFromJson(Map<String, dynamic> json) =>
    _JobOfferModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => JobCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      image: json['image'] == null
          ? null
          : JobImageModel.fromJson(json['image'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : JobLocationModel.fromJson(json['location'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : JobGenderModel.fromJson(json['gender'] as Map<String, dynamic>),
      actor: json['actor'] == null
          ? null
          : JobActorModel.fromJson(json['actor'] as Map<String, dynamic>),
      dateLimit: json['date_limit'] as String? ?? '',
      status: json['status'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$JobOfferModelToJson(_JobOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'image': instance.image,
      'location': instance.location,
      'gender': instance.gender,
      'actor': instance.actor,
      'date_limit': instance.dateLimit,
      'status': instance.status,
      'user': instance.user,
      'created_at': instance.createdAt,
    };
