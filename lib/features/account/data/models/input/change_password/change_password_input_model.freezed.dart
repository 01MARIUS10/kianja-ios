// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_password_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChangePasswordInputModel {

@JsonKey(name: 'old_password') String get oldPassword;@JsonKey(name: 'new_password') String get newPassword;
/// Create a copy of ChangePasswordInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordInputModelCopyWith<ChangePasswordInputModel> get copyWith => _$ChangePasswordInputModelCopyWithImpl<ChangePasswordInputModel>(this as ChangePasswordInputModel, _$identity);

  /// Serializes this ChangePasswordInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordInputModel&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword);

@override
String toString() {
  return 'ChangePasswordInputModel(oldPassword: $oldPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordInputModelCopyWith<$Res>  {
  factory $ChangePasswordInputModelCopyWith(ChangePasswordInputModel value, $Res Function(ChangePasswordInputModel) _then) = _$ChangePasswordInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'old_password') String oldPassword,@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class _$ChangePasswordInputModelCopyWithImpl<$Res>
    implements $ChangePasswordInputModelCopyWith<$Res> {
  _$ChangePasswordInputModelCopyWithImpl(this._self, this._then);

  final ChangePasswordInputModel _self;
  final $Res Function(ChangePasswordInputModel) _then;

/// Create a copy of ChangePasswordInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldPassword = null,Object? newPassword = null,}) {
  return _then(_self.copyWith(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangePasswordInputModel].
extension ChangePasswordInputModelPatterns on ChangePasswordInputModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangePasswordInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangePasswordInputModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangePasswordInputModel value)  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordInputModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangePasswordInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChangePasswordInputModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'old_password')  String oldPassword, @JsonKey(name: 'new_password')  String newPassword)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangePasswordInputModel() when $default != null:
return $default(_that.oldPassword,_that.newPassword);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'old_password')  String oldPassword, @JsonKey(name: 'new_password')  String newPassword)  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordInputModel():
return $default(_that.oldPassword,_that.newPassword);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'old_password')  String oldPassword, @JsonKey(name: 'new_password')  String newPassword)?  $default,) {final _that = this;
switch (_that) {
case _ChangePasswordInputModel() when $default != null:
return $default(_that.oldPassword,_that.newPassword);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangePasswordInputModel extends ChangePasswordInputModel {
  const _ChangePasswordInputModel({@JsonKey(name: 'old_password') required this.oldPassword, @JsonKey(name: 'new_password') required this.newPassword}): super._();
  factory _ChangePasswordInputModel.fromJson(Map<String, dynamic> json) => _$ChangePasswordInputModelFromJson(json);

@override@JsonKey(name: 'old_password') final  String oldPassword;
@override@JsonKey(name: 'new_password') final  String newPassword;

/// Create a copy of ChangePasswordInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangePasswordInputModelCopyWith<_ChangePasswordInputModel> get copyWith => __$ChangePasswordInputModelCopyWithImpl<_ChangePasswordInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangePasswordInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangePasswordInputModel&&(identical(other.oldPassword, oldPassword) || other.oldPassword == oldPassword)&&(identical(other.newPassword, newPassword) || other.newPassword == newPassword));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,oldPassword,newPassword);

@override
String toString() {
  return 'ChangePasswordInputModel(oldPassword: $oldPassword, newPassword: $newPassword)';
}


}

/// @nodoc
abstract mixin class _$ChangePasswordInputModelCopyWith<$Res> implements $ChangePasswordInputModelCopyWith<$Res> {
  factory _$ChangePasswordInputModelCopyWith(_ChangePasswordInputModel value, $Res Function(_ChangePasswordInputModel) _then) = __$ChangePasswordInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'old_password') String oldPassword,@JsonKey(name: 'new_password') String newPassword
});




}
/// @nodoc
class __$ChangePasswordInputModelCopyWithImpl<$Res>
    implements _$ChangePasswordInputModelCopyWith<$Res> {
  __$ChangePasswordInputModelCopyWithImpl(this._self, this._then);

  final _ChangePasswordInputModel _self;
  final $Res Function(_ChangePasswordInputModel) _then;

/// Create a copy of ChangePasswordInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldPassword = null,Object? newPassword = null,}) {
  return _then(_ChangePasswordInputModel(
oldPassword: null == oldPassword ? _self.oldPassword : oldPassword // ignore: cast_nullable_to_non_nullable
as String,newPassword: null == newPassword ? _self.newPassword : newPassword // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
