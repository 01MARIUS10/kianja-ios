import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_complaints_suggestions_input_model.freezed.dart';
part 'send_complaints_suggestions_input_model.g.dart';

@freezed
abstract class SendComplaintsSuggestionsInputModel
    with _$SendComplaintsSuggestionsInputModel {
  const factory SendComplaintsSuggestionsInputModel({
    @JsonKey(name: 'titre', defaultValue: '') required String title,
    @JsonKey(name: 'description_detaille', defaultValue: '')
    required String description,
    @JsonKey(name: 'imagesId', defaultValue: []) List<int>? imageIds,
  }) = _SendComplaintsSuggestionsInputModel;

  const SendComplaintsSuggestionsInputModel._();

  factory SendComplaintsSuggestionsInputModel.fromJson(
    Map<String, dynamic> json,
  ) => _$SendComplaintsSuggestionsInputModelFromJson(json);
}
