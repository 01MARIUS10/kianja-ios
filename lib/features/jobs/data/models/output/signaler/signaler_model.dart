import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/motif/motif_model.dart';
import 'package:kianja/features/jobs/domain/entities/signaler/signaler.dart';

part 'signaler_model.freezed.dart';
part 'signaler_model.g.dart';

@freezed
abstract class SignalerModel with _$SignalerModel implements Signaler {
  const factory SignalerModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'contenu_id', defaultValue: -1) required int contenuId,
    @JsonKey(name: 'motif') required MotifModel motif,
    @JsonKey(name: 'commentaire') String? commentaire,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
  }) = _SignalerModel;

  const SignalerModel._();

  factory SignalerModel.fromJson(Map<String, dynamic> json) =>
      _$SignalerModelFromJson(json);
}
