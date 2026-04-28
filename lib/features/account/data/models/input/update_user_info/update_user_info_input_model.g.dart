// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserInfoInputModel _$UpdateUserInfoInputModelFromJson(
  Map<String, dynamic> json,
) => _UpdateUserInfoInputModel(
  firstName: json['first_name'] as String? ?? '',
  lastName: json['last_name'] as String? ?? '',
  photo: json['photo'] as String? ?? '',
  pseudo: json['pseudo'] as String? ?? 'pseudo',
  email: json['email'] as String? ?? '',
  residence: json['lieu_residence'] as String? ?? '',
);

Map<String, dynamic> _$UpdateUserInfoInputModelToJson(
  _UpdateUserInfoInputModel instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'photo': instance.photo,
  'pseudo': instance.pseudo,
  'email': instance.email,
  'lieu_residence': instance.residence,
};
