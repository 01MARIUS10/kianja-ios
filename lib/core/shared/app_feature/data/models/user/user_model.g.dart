// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['user_id'] as num?)?.toInt() ?? -1,
  firstName: json['first_name'] as String? ?? '',
  lastName: json['last_name'] as String? ?? '',
  photoUrl: json['photo'] as String? ?? '',
  cvUrl: json['cv_url'] as String? ?? '',
  phone: json['phone'] as String? ?? '',
  email: json['email'] as String? ?? '',
  residence: json['lieu_residence'] as String? ?? '',
  dateCandidature: json['date_candidature'] as String? ?? '',
  createdAt: json['created_at'] as String? ?? '',
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'photo': instance.photoUrl,
      'cv_url': instance.cvUrl,
      'phone': instance.phone,
      'email': instance.email,
      'lieu_residence': instance.residence,
      'date_candidature': instance.dateCandidature,
      'created_at': instance.createdAt,
    };
