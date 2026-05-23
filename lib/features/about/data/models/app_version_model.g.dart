// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_version_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppVersionModel _$AppVersionModelFromJson(Map<String, dynamic> json) =>
    _AppVersionModel(
      version: json['version'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
    );

Map<String, dynamic> _$AppVersionModelToJson(_AppVersionModel instance) =>
    <String, dynamic>{
      'version': instance.version,
      'filename': instance.filename,
    };
