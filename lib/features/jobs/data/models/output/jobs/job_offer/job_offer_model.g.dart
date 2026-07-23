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
      locations:
          (json['locations'] as List<dynamic>?)
              ?.map((e) => JobLocationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => JobImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : JobImageModel.fromJson(json['image'] as Map<String, dynamic>),
      gender: json['gender'] == null
          ? null
          : JobGenderModel.fromJson(json['gender'] as Map<String, dynamic>),
      actor: json['actor'] == null
          ? null
          : JobActorModel.fromJson(json['actor'] as Map<String, dynamic>),
      preference: json['preference'] == null
          ? null
          : JobPreferenceModel.fromJson(
              json['preference'] as Map<String, dynamic>,
            ),
      dateLimit: json['date_limit'] as String? ?? '',
      candidatsCount: (json['candidats_count'] as num?)?.toInt() ?? 0,
      status: json['status'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String? ?? '',
      isFavorite: json['isFavorite'] as bool? ?? false,
      alreadyPostuler: json['alreadyPostuler'] as bool? ?? false,
    );

Map<String, dynamic> _$JobOfferModelToJson(_JobOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'locations': instance.locations,
      'images': instance.images,
      'image': instance.image,
      'gender': instance.gender,
      'actor': instance.actor,
      'preference': instance.preference,
      'date_limit': instance.dateLimit,
      'candidats_count': instance.candidatsCount,
      'status': instance.status,
      'user': instance.user,
      'created_at': instance.createdAt,
      'isFavorite': instance.isFavorite,
      'alreadyPostuler': instance.alreadyPostuler,
    };
