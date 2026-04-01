// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  photoUrl: json['photoUrl'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  genre: json['genre'] as String,
  pseudo: json['pseudo'] as String,
  residence: json['residence'] as String,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'photoUrl': instance.photoUrl,
      'email': instance.email,
      'phone': instance.phone,
      'genre': instance.genre,
      'pseudo': instance.pseudo,
      'residence': instance.residence,
    };
