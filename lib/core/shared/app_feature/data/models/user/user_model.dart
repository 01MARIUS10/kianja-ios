import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel implements User {
  const factory UserModel({
    @JsonKey(name: 'user_id', defaultValue: -1) required int id,
    @JsonKey(name: 'first_name', defaultValue: '') required String firstName,
    @JsonKey(name: 'last_name', defaultValue: '') required String lastName,
    @JsonKey(name: 'photo', defaultValue: '') required String photoUrl,
    @JsonKey(defaultValue: '') required String phone,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(name: 'lieu_residence', defaultValue: '')
    required String residence,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
  }) = _UserModel;

  const UserModel._();

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
