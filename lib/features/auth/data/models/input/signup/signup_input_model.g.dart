// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignUpInputModel _$SignUpInputModelFromJson(Map<String, dynamic> json) =>
    _SignUpInputModel(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      birthDate: (json['annee_naissance'] as num?)?.toInt() ?? 0,
      residence: json['lieu_residence'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$SignUpInputModelToJson(_SignUpInputModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'genre': instance.genre,
      'phone': instance.phone,
      'annee_naissance': instance.birthDate,
      'lieu_residence': instance.residence,
      'email': instance.email,
      'password': instance.password,
    };
