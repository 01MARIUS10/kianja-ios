import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/motif/motif.dart';

part 'motif_model.freezed.dart';
part 'motif_model.g.dart';

@freezed
abstract class MotifModel with _$MotifModel implements Motif {
  const factory MotifModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'libelle', defaultValue: '') required String libelle,
  }) = _MotifModel;

  const MotifModel._();

  factory MotifModel.fromJson(Map<String, dynamic> json) =>
      _$MotifModelFromJson(json);
}
