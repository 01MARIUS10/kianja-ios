// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobApplicantModel _$JobApplicantModelFromJson(
  Map<String, dynamic> json,
) => _JobApplicantModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  title: json['title'] as String? ?? '',
  motivation: json['motivation'] as String? ?? '',
  location: JobLocationModel.fromJson(json['location'] as Map<String, dynamic>),
  gender: json['gender'] == null
      ? null
      : JobGenderModel.fromJson(json['gender'] as Map<String, dynamic>),
  pdfUrl: json['resumepdf_path'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  category: JobCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
);

Map<String, dynamic> _$JobApplicantModelToJson(_JobApplicantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'motivation': instance.motivation,
      'location': instance.location,
      'gender': instance.gender,
      'resumepdf_path': instance.pdfUrl,
      'created_at': instance.createdAt,
      'user': instance.user,
      'category': instance.category,
    };
