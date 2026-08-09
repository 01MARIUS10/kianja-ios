// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_complaints_suggestions_input_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendComplaintsSuggestionsInputModel
_$SendComplaintsSuggestionsInputModelFromJson(Map<String, dynamic> json) =>
    _SendComplaintsSuggestionsInputModel(
      title: json['titre'] as String? ?? '',
      description: json['description_detaille'] as String? ?? '',
      imageIds:
          (json['imagesId'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
    );

Map<String, dynamic> _$SendComplaintsSuggestionsInputModelToJson(
  _SendComplaintsSuggestionsInputModel instance,
) => <String, dynamic>{
  'titre': instance.title,
  'description_detaille': instance.description,
  'imagesId': instance.imageIds,
};
