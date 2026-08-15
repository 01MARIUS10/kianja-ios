import 'package:freezed_annotation/freezed_annotation.dart';

part 'signaler_contenu_input_model.freezed.dart';
part 'signaler_contenu_input_model.g.dart';

@freezed
abstract class SignalerContenuInputModel with _$SignalerContenuInputModel {
  const factory SignalerContenuInputModel({
    @JsonKey(name: 'id', defaultValue: -1) required int contenuId,
    @JsonKey(name: 'type', defaultValue: '') required String type,
    @JsonKey(name: 'motif_id', defaultValue: -1) required int motifId,
    @JsonKey(name: 'commentaire', defaultValue: '') String? commentaire,
  }) = _SignalerContenuInputModel;

  const SignalerContenuInputModel._();

  factory SignalerContenuInputModel.fromJson(Map<String, dynamic> json) =>
      _$SignalerContenuInputModelFromJson(json);
}
