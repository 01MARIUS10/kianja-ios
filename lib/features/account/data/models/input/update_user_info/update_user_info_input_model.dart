import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_info_input_model.freezed.dart';
part 'update_user_info_input_model.g.dart';

@freezed
abstract class UpdateUserInfoInputModel with _$UpdateUserInfoInputModel {
  const factory UpdateUserInfoInputModel({
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'last_name', defaultValue: '') required String lastName,
    @JsonKey(defaultValue: '') required String photo,
    @JsonKey(defaultValue: 'pseudo') required String pseudo,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(name: 'lieu_residence', defaultValue: '')
    required String residence,
  }) = _UpdateUserInfoInputModel;

  const UpdateUserInfoInputModel._();

  factory UpdateUserInfoInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserInfoInputModelFromJson(json);
}
