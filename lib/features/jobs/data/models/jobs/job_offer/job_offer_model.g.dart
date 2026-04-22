// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobOfferModel _$JobOfferModelFromJson(Map<String, dynamic> json) =>
    _JobOfferModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userFirstName: json['userFirstName'] as String,
      userLastName: json['userLastName'] as String,
      userPhoto: json['userPhoto'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      description: json['description'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      location: json['location'] as String,
      gender: json['gender'] as String,
      actor: json['actor'] as String,
      limitDate: json['limitDate'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$JobOfferModelToJson(_JobOfferModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userFirstName': instance.userFirstName,
      'userLastName': instance.userLastName,
      'userPhoto': instance.userPhoto,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
      'description': instance.description,
      'categories': instance.categories,
      'location': instance.location,
      'gender': instance.gender,
      'actor': instance.actor,
      'limitDate': instance.limitDate,
      'createdAt': instance.createdAt,
    };
