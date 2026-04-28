// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_user_info_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateUserInfoInputModel {

@JsonKey(name: 'first_name', defaultValue: '') String get firstName;@JsonKey(name: 'last_name', defaultValue: '') String get lastName;@JsonKey(defaultValue: '') String get photo;@JsonKey(defaultValue: 'pseudo') String get pseudo;@JsonKey(defaultValue: '') String get email;@JsonKey(name: 'lieu_residence', defaultValue: '') String get residence;
/// Create a copy of UpdateUserInfoInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateUserInfoInputModelCopyWith<UpdateUserInfoInputModel> get copyWith => _$UpdateUserInfoInputModelCopyWithImpl<UpdateUserInfoInputModel>(this as UpdateUserInfoInputModel, _$identity);

  /// Serializes this UpdateUserInfoInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateUserInfoInputModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.pseudo, pseudo) || other.pseudo == pseudo)&&(identical(other.email, email) || other.email == email)&&(identical(other.residence, residence) || other.residence == residence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,photo,pseudo,email,residence);

@override
String toString() {
  return 'UpdateUserInfoInputModel(firstName: $firstName, lastName: $lastName, photo: $photo, pseudo: $pseudo, email: $email, residence: $residence)';
}


}

/// @nodoc
abstract mixin class $UpdateUserInfoInputModelCopyWith<$Res>  {
  factory $UpdateUserInfoInputModelCopyWith(UpdateUserInfoInputModel value, $Res Function(UpdateUserInfoInputModel) _then) = _$UpdateUserInfoInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(defaultValue: '') String photo,@JsonKey(defaultValue: 'pseudo') String pseudo,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence
});




}
/// @nodoc
class _$UpdateUserInfoInputModelCopyWithImpl<$Res>
    implements $UpdateUserInfoInputModelCopyWith<$Res> {
  _$UpdateUserInfoInputModelCopyWithImpl(this._self, this._then);

  final UpdateUserInfoInputModel _self;
  final $Res Function(UpdateUserInfoInputModel) _then;

/// Create a copy of UpdateUserInfoInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? photo = null,Object? pseudo = null,Object? email = null,Object? residence = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,pseudo: null == pseudo ? _self.pseudo : pseudo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateUserInfoInputModel].
extension UpdateUserInfoInputModelPatterns on UpdateUserInfoInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateUserInfoInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateUserInfoInputModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateUserInfoInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String photo, @JsonKey(defaultValue: 'pseudo')  String pseudo, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.photo,_that.pseudo,_that.email,_that.residence);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String photo, @JsonKey(defaultValue: 'pseudo')  String pseudo, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence)  $default,) {final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel():
return $default(_that.firstName,_that.lastName,_that.photo,_that.pseudo,_that.email,_that.residence);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String photo, @JsonKey(defaultValue: 'pseudo')  String pseudo, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence)?  $default,) {final _that = this;
switch (_that) {
case _UpdateUserInfoInputModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.photo,_that.pseudo,_that.email,_that.residence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateUserInfoInputModel extends UpdateUserInfoInputModel {
  const _UpdateUserInfoInputModel({@JsonKey(name: 'first_name', defaultValue: '') required this.firstName, @JsonKey(name: 'last_name', defaultValue: '') required this.lastName, @JsonKey(defaultValue: '') required this.photo, @JsonKey(defaultValue: 'pseudo') required this.pseudo, @JsonKey(defaultValue: '') required this.email, @JsonKey(name: 'lieu_residence', defaultValue: '') required this.residence}): super._();
  factory _UpdateUserInfoInputModel.fromJson(Map<String, dynamic> json) => _$UpdateUserInfoInputModelFromJson(json);

@override@JsonKey(name: 'first_name', defaultValue: '') final  String firstName;
@override@JsonKey(name: 'last_name', defaultValue: '') final  String lastName;
@override@JsonKey(defaultValue: '') final  String photo;
@override@JsonKey(defaultValue: 'pseudo') final  String pseudo;
@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(name: 'lieu_residence', defaultValue: '') final  String residence;

/// Create a copy of UpdateUserInfoInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateUserInfoInputModelCopyWith<_UpdateUserInfoInputModel> get copyWith => __$UpdateUserInfoInputModelCopyWithImpl<_UpdateUserInfoInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateUserInfoInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateUserInfoInputModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.pseudo, pseudo) || other.pseudo == pseudo)&&(identical(other.email, email) || other.email == email)&&(identical(other.residence, residence) || other.residence == residence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,photo,pseudo,email,residence);

@override
String toString() {
  return 'UpdateUserInfoInputModel(firstName: $firstName, lastName: $lastName, photo: $photo, pseudo: $pseudo, email: $email, residence: $residence)';
}


}

/// @nodoc
abstract mixin class _$UpdateUserInfoInputModelCopyWith<$Res> implements $UpdateUserInfoInputModelCopyWith<$Res> {
  factory _$UpdateUserInfoInputModelCopyWith(_UpdateUserInfoInputModel value, $Res Function(_UpdateUserInfoInputModel) _then) = __$UpdateUserInfoInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(defaultValue: '') String photo,@JsonKey(defaultValue: 'pseudo') String pseudo,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence
});




}
/// @nodoc
class __$UpdateUserInfoInputModelCopyWithImpl<$Res>
    implements _$UpdateUserInfoInputModelCopyWith<$Res> {
  __$UpdateUserInfoInputModelCopyWithImpl(this._self, this._then);

  final _UpdateUserInfoInputModel _self;
  final $Res Function(_UpdateUserInfoInputModel) _then;

/// Create a copy of UpdateUserInfoInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? photo = null,Object? pseudo = null,Object? email = null,Object? residence = null,}) {
  return _then(_UpdateUserInfoInputModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,pseudo: null == pseudo ? _self.pseudo : pseudo // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
