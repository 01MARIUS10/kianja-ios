import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_job_offer_input_model.freezed.dart';
part 'create_job_offer_input_model.g.dart';

@freezed
abstract class CreateJobOfferInputModel with _$CreateJobOfferInputModel {
  const factory CreateJobOfferInputModel({
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'image_id') int? imageId,
    List<int>? imageIds,
    @JsonKey(name: 'categoryIds', defaultValue: [])
    required List<int> categories,
    @JsonKey(name: 'locationIds', defaultValue: [])
    required List<int> locationIds,
    // @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(defaultValue: -1) required int genderId,
    @JsonKey(defaultValue: -1) required int actorId,
    @JsonKey(defaultValue: false) required bool showButton,
    @JsonKey(name: 'date_limit', defaultValue: '') required String limitDate,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _CreateJobOfferInputModel;

  const CreateJobOfferInputModel._();

  factory CreateJobOfferInputModel.fromJson(Map<String, dynamic> json) =>
      _$CreateJobOfferInputModelFromJson(json);
}
