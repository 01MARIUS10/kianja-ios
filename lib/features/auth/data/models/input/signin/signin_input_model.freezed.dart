// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInInputModel {

@JsonKey(defaultValue: '') String get email;@JsonKey(defaultValue: '') String get password;@JsonKey(name: 'a_vis', defaultValue: 0) int get aVis;
/// Create a copy of SignInInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInInputModelCopyWith<SignInInputModel> get copyWith => _$SignInInputModelCopyWithImpl<SignInInputModel>(this as SignInInputModel, _$identity);

  /// Serializes this SignInInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInInputModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.aVis, aVis) || other.aVis == aVis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,aVis);

@override
String toString() {
  return 'SignInInputModel(email: $email, password: $password, aVis: $aVis)';
}


}

/// @nodoc
abstract mixin class $SignInInputModelCopyWith<$Res>  {
  factory $SignInInputModelCopyWith(SignInInputModel value, $Res Function(SignInInputModel) _then) = _$SignInInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String email,@JsonKey(defaultValue: '') String password,@JsonKey(name: 'a_vis', defaultValue: 0) int aVis
});




}
/// @nodoc
class _$SignInInputModelCopyWithImpl<$Res>
    implements $SignInInputModelCopyWith<$Res> {
  _$SignInInputModelCopyWithImpl(this._self, this._then);

  final SignInInputModel _self;
  final $Res Function(SignInInputModel) _then;

/// Create a copy of SignInInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? password = null,Object? aVis = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,aVis: null == aVis ? _self.aVis : aVis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInInputModel].
extension SignInInputModelPatterns on SignInInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInInputModel value)  $default,){
final _that = this;
switch (_that) {
case _SignInInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _SignInInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password, @JsonKey(name: 'a_vis', defaultValue: 0)  int aVis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInInputModel() when $default != null:
return $default(_that.email,_that.password,_that.aVis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password, @JsonKey(name: 'a_vis', defaultValue: 0)  int aVis)  $default,) {final _that = this;
switch (_that) {
case _SignInInputModel():
return $default(_that.email,_that.password,_that.aVis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password, @JsonKey(name: 'a_vis', defaultValue: 0)  int aVis)?  $default,) {final _that = this;
switch (_that) {
case _SignInInputModel() when $default != null:
return $default(_that.email,_that.password,_that.aVis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignInInputModel extends SignInInputModel {
  const _SignInInputModel({@JsonKey(defaultValue: '') required this.email, @JsonKey(defaultValue: '') required this.password, @JsonKey(name: 'a_vis', defaultValue: 0) required this.aVis}): super._();
  factory _SignInInputModel.fromJson(Map<String, dynamic> json) => _$SignInInputModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(defaultValue: '') final  String password;
@override@JsonKey(name: 'a_vis', defaultValue: 0) final  int aVis;

/// Create a copy of SignInInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInInputModelCopyWith<_SignInInputModel> get copyWith => __$SignInInputModelCopyWithImpl<_SignInInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignInInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInInputModel&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.aVis, aVis) || other.aVis == aVis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,password,aVis);

@override
String toString() {
  return 'SignInInputModel(email: $email, password: $password, aVis: $aVis)';
}


}

/// @nodoc
abstract mixin class _$SignInInputModelCopyWith<$Res> implements $SignInInputModelCopyWith<$Res> {
  factory _$SignInInputModelCopyWith(_SignInInputModel value, $Res Function(_SignInInputModel) _then) = __$SignInInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String email,@JsonKey(defaultValue: '') String password,@JsonKey(name: 'a_vis', defaultValue: 0) int aVis
});




}
/// @nodoc
class __$SignInInputModelCopyWithImpl<$Res>
    implements _$SignInInputModelCopyWith<$Res> {
  __$SignInInputModelCopyWithImpl(this._self, this._then);

  final _SignInInputModel _self;
  final $Res Function(_SignInInputModel) _then;

/// Create a copy of SignInInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? aVis = null,}) {
  return _then(_SignInInputModel(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,aVis: null == aVis ? _self.aVis : aVis // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
