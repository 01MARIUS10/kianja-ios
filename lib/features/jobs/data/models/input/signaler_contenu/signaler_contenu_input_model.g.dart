// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signaler_contenu_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignalerContenuInputModel _$SignalerContenuInputModelFromJson(
  Map<String, dynamic> json,
) => _SignalerContenuInputModel(
  contenuId: (json['id'] as num?)?.toInt() ?? -1,
  type: json['type'] as String? ?? '',
  motifId: (json['motif_id'] as num?)?.toInt() ?? -1,
  commentaire: json['commentaire'] as String? ?? '',
);

Map<String, dynamic> _$SignalerContenuInputModelToJson(
  _SignalerContenuInputModel instance,
) => <String, dynamic>{
  'id': instance.contenuId,
  'type': instance.type,
  'motif_id': instance.motifId,
  'commentaire': instance.commentaire,
};
