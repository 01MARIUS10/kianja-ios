import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_input_model.freezed.dart';
part 'change_password_input_model.g.dart';

@freezed
abstract class ChangePasswordInputModel with _$ChangePasswordInputModel {
  const factory ChangePasswordInputModel({
    @JsonKey(name: 'old_password') required String oldPassword,
    @JsonKey(name: 'new_password') required String newPassword,
  }) = _ChangePasswordInputModel;

  const ChangePasswordInputModel._();

  factory ChangePasswordInputModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordInputModelFromJson(json);
}
