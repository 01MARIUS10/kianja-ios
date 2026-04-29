import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_input_model.freezed.dart';
part 'signin_input_model.g.dart';

@freezed
abstract class SignInInputModel with _$SignInInputModel {
  const factory SignInInputModel({
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(defaultValue: '') required String password,
    @JsonKey(name: 'a_vis', defaultValue: 0) required int aVis,
  }) = _SignInInputModel;

  const SignInInputModel._();

  factory SignInInputModel.fromJson(Map<String, dynamic> json) =>
      _$SignInInputModelFromJson(json);
}
