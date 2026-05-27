// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kara_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KaraHistoryModel _$KaraHistoryModelFromJson(Map<String, dynamic> json) =>
    _KaraHistoryModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      type: json['type'] as String? ?? '',
      message: json['message'] as String? ?? '',
      montant: json['montant'] as String? ?? '',
      isIncome: json['is_icome'] as bool? ?? false,
      date: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$KaraHistoryModelToJson(_KaraHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'message': instance.message,
      'montant': instance.montant,
      'is_icome': instance.isIncome,
      'created_at': instance.date,
    };
