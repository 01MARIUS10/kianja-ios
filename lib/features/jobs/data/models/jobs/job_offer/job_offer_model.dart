import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

part 'job_offer_model.freezed.dart';
part 'job_offer_model.g.dart';

@freezed
abstract class JobOfferModel with _$JobOfferModel implements JobOffer {
  const factory JobOfferModel({
    required int id,
    required int userId,
    required String userFirstName,
    required String userLastName,
    required String userPhoto,
    required String title,
    required String imageUrl,
    required String description,
    required List<String> categories,
    required String location,
    required String gender,
    required String actor,
    required String limitDate,
    required String createdAt,
  }) = _JobOfferModel;

  const JobOfferModel._();

  factory JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferModelFromJson(json);
}
