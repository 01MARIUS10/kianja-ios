// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignInInputModel _$SignInInputModelFromJson(Map<String, dynamic> json) =>
    _SignInInputModel(
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      aVis: (json['a_vis'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SignInInputModelToJson(_SignInInputModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'a_vis': instance.aVis,
    };
