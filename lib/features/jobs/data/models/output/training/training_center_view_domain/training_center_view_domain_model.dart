import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_view_all_domain.dart';

part 'training_center_view_domain_model.freezed.dart';
part 'training_center_view_domain_model.g.dart';

@freezed
abstract class TrainingCenterViewDomainModel
    with _$TrainingCenterViewDomainModel
    implements TrainingCenterViewDomain {
  const factory TrainingCenterViewDomainModel({
    @JsonKey(name: 'Vip', defaultValue: [])
    required List<TrainingCenterModel> vip,
    @JsonKey(name: 'Premium', defaultValue: [])
    required List<TrainingCenterModel> premium,
    @JsonKey(name: 'Normal', defaultValue: [])
    required List<TrainingCenterModel> normal,
  }) = _TrainingCenterViewDomainModel;

  const TrainingCenterViewDomainModel._();

  factory TrainingCenterViewDomainModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingCenterViewDomainModelFromJson(json);
}
