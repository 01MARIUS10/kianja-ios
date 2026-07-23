import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_job_offer_input_model.freezed.dart';
part 'update_job_offer_input_model.g.dart';

@freezed
abstract class UpdateJobOfferInputModel with _$UpdateJobOfferInputModel {
  const factory UpdateJobOfferInputModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'image_id') int? imageId,
    List<int>? imageIds,
    @JsonKey(name: 'categoryIds', defaultValue: [])
    required List<int> categories,
    @JsonKey(name: 'locationsIds', defaultValue: [])
    required List<int> locations,
    // @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(defaultValue: -1) required int genderId,
    @JsonKey(defaultValue: -1) required int actorId,
    @JsonKey(defaultValue: false) required bool showButton,
    @JsonKey(name: 'date_limit', defaultValue: '') required String limitDate,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _UpdateJobOfferInputModel;

  const UpdateJobOfferInputModel._();

  factory UpdateJobOfferInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateJobOfferInputModelFromJson(json);
}
