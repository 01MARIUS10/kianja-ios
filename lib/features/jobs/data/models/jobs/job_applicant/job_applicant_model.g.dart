// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantModel _$JobApplicantModelFromJson(Map<String, dynamic> json) =>
    _JobApplicantModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      photo: json['photo'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$JobApplicantModelToJson(_JobApplicantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photo': instance.photo,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
