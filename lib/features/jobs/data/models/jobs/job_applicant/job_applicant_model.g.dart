// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantModel _$JobApplicantModelFromJson(Map<String, dynamic> json) =>
    _JobApplicantModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      userFirstName: json['userFirstName'] as String,
      userLastName: json['userLastName'] as String,
      userPhoto: json['userPhoto'] as String,
      title: json['title'] as String,
      motivation: json['motivation'] as String,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      location: json['location'] as String,
      gender: json['gender'] as String,
      pdfUrl: json['pdfUrl'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$JobApplicantModelToJson(_JobApplicantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userFirstName': instance.userFirstName,
      'userLastName': instance.userLastName,
      'userPhoto': instance.userPhoto,
      'title': instance.title,
      'motivation': instance.motivation,
      'categories': instance.categories,
      'location': instance.location,
      'gender': instance.gender,
      'pdfUrl': instance.pdfUrl,
      'createdAt': instance.createdAt,
    };
