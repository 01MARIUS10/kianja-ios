import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

part 'job_offer_model.freezed.dart';
part 'job_offer_model.g.dart';

@freezed
abstract class JobOfferModel with _$JobOfferModel implements JobOffer {
  const factory JobOfferModel({
    required int id,
    required int userId,
    required String firstName,
    required String lastName,
    required String photo,
    required String title,
    required String description,
    required String createdAt,
  }) = _JobOfferModel;

  const JobOfferModel._();

  factory JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferModelFromJson(json);
}
