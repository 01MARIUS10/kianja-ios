import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';

part 'kara_history_model.freezed.dart';
part 'kara_history_model.g.dart';

@freezed
abstract class KaraHistoryModel with _$KaraHistoryModel implements KaraHistory {
  const factory KaraHistoryModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String type,
    @JsonKey(defaultValue: '') required String message,
    @JsonKey(defaultValue: '') required String montant,
    @JsonKey(name: 'is_icome', defaultValue: false) required bool isIncome,
    @JsonKey(name: 'created_at', defaultValue: '') required String date,
  }) = _KaraHistoryModel;

  const KaraHistoryModel._();

  factory KaraHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$KaraHistoryModelFromJson(json);
}
