// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangePasswordInputModel _$ChangePasswordInputModelFromJson(
  Map<String, dynamic> json,
) => _ChangePasswordInputModel(
  oldPassword: json['old_password'] as String,
  newPassword: json['new_password'] as String,
);

Map<String, dynamic> _$ChangePasswordInputModelToJson(
  _ChangePasswordInputModel instance,
) => <String, dynamic>{
  'old_password': instance.oldPassword,
  'new_password': instance.newPassword,
};
