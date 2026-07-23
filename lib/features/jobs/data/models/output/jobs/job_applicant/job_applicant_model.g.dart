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
      gender: json['gender'] == null
          ? null
          : JobGenderModel.fromJson(json['gender'] as Map<String, dynamic>),
      photoUrl: json['photo_candidat'] as String?,
      pdfUrl: json['resumepdf_path'] as String?,
      createdAt: json['created_at'] as String? ?? '',
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$JobApplicantModelToJson(_JobApplicantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'motivation': instance.motivation,
      'categories': instance.categories,
      'locations': instance.locations,
      'gender': instance.gender,
      'photo_candidat': instance.photoUrl,
      'resumepdf_path': instance.pdfUrl,
      'created_at': instance.createdAt,
      'user': instance.user,
      'isFavorite': instance.isFavorite,
    };
