import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_input_model.freezed.dart';
part 'signup_input_model.g.dart';

@freezed
abstract class SignUpInputModel with _$SignUpInputModel {
  const factory SignUpInputModel({
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'last_name', defaultValue: '') required String lastName,
    @JsonKey(defaultValue: '') required String genre,
    @JsonKey(defaultValue: '') required String phone,
    @JsonKey(name: 'annee_naissance', defaultValue: 0) required int birthDate,
    @JsonKey(name: 'lieu_residence', defaultValue: '')
    required String residence,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(defaultValue: '') required String password,
  }) = _SignUpInputModel;

  const SignUpInputModel._();

  factory SignUpInputModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpInputModelFromJson(json);
}
