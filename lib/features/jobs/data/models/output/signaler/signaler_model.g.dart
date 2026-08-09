// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signaler_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignalerModel _$SignalerModelFromJson(Map<String, dynamic> json) =>
    _SignalerModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      type: json['type'] as String? ?? '',
      contenuId: (json['contenu_id'] as num?)?.toInt() ?? -1,
      motif: MotifModel.fromJson(json['motif'] as Map<String, dynamic>),
      commentaire: json['commentaire'] as String?,
      createdAt: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$SignalerModelToJson(_SignalerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'contenu_id': instance.contenuId,
      'motif': instance.motif,
      'commentaire': instance.commentaire,
      'created_at': instance.createdAt,
    };
