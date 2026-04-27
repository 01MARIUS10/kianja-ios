// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantModel _$JobApplicantModelFromJson(Map<String, dynamic> json) =>
    _JobApplicantModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      title: json['title'] as String? ?? '',
      motivation: json['motivation'] as String? ?? '',
      location: json['location'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      pdfUrl: json['pdf_url'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobApplicantModelToJson(_JobApplicantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'motivation': instance.motivation,
      'location': instance.location,
      'gender': instance.gender,
      'pdf_url': instance.pdfUrl,
      'created_at': instance.createdAt,
      'user': instance.user,
      'categories': instance.categories,
    };
