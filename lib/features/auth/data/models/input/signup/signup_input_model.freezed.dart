// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpInputModel {

@JsonKey(name: 'first_name', defaultValue: '') String get firstName;@JsonKey(name: 'last_name', defaultValue: '') String get lastName;@JsonKey(defaultValue: '') String get genre;@JsonKey(defaultValue: '') String get phone;@JsonKey(name: 'annee_naissance', defaultValue: 0) int get birthDate;@JsonKey(name: 'lieu_residence', defaultValue: '') String get residence;@JsonKey(defaultValue: '') String get email;@JsonKey(defaultValue: '') String get password;
/// Create a copy of SignUpInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpInputModelCopyWith<SignUpInputModel> get copyWith => _$SignUpInputModelCopyWithImpl<SignUpInputModel>(this as SignUpInputModel, _$identity);

  /// Serializes this SignUpInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpInputModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.residence, residence) || other.residence == residence)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,genre,phone,birthDate,residence,email,password);

@override
String toString() {
  return 'SignUpInputModel(firstName: $firstName, lastName: $lastName, genre: $genre, phone: $phone, birthDate: $birthDate, residence: $residence, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignUpInputModelCopyWith<$Res>  {
  factory $SignUpInputModelCopyWith(SignUpInputModel value, $Res Function(SignUpInputModel) _then) = _$SignUpInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(defaultValue: '') String genre,@JsonKey(defaultValue: '') String phone,@JsonKey(name: 'annee_naissance', defaultValue: 0) int birthDate,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence,@JsonKey(defaultValue: '') String email,@JsonKey(defaultValue: '') String password
});




}
/// @nodoc
class _$SignUpInputModelCopyWithImpl<$Res>
    implements $SignUpInputModelCopyWith<$Res> {
  _$SignUpInputModelCopyWithImpl(this._self, this._then);

  final SignUpInputModel _self;
  final $Res Function(SignUpInputModel) _then;

/// Create a copy of SignUpInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstName = null,Object? lastName = null,Object? genre = null,Object? phone = null,Object? birthDate = null,Object? residence = null,Object? email = null,Object? password = null,}) {
  return _then(_self.copyWith(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as int,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SignUpInputModel].
extension SignUpInputModelPatterns on SignUpInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignUpInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignUpInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignUpInputModel value)  $default,){
final _that = this;
switch (_that) {
case _SignUpInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignUpInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _SignUpInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String genre, @JsonKey(defaultValue: '')  String phone, @JsonKey(name: 'annee_naissance', defaultValue: 0)  int birthDate, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignUpInputModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.genre,_that.phone,_that.birthDate,_that.residence,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String genre, @JsonKey(defaultValue: '')  String phone, @JsonKey(name: 'annee_naissance', defaultValue: 0)  int birthDate, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password)  $default,) {final _that = this;
switch (_that) {
case _SignUpInputModel():
return $default(_that.firstName,_that.lastName,_that.genre,_that.phone,_that.birthDate,_that.residence,_that.email,_that.password);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(defaultValue: '')  String genre, @JsonKey(defaultValue: '')  String phone, @JsonKey(name: 'annee_naissance', defaultValue: 0)  int birthDate, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(defaultValue: '')  String email, @JsonKey(defaultValue: '')  String password)?  $default,) {final _that = this;
switch (_that) {
case _SignUpInputModel() when $default != null:
return $default(_that.firstName,_that.lastName,_that.genre,_that.phone,_that.birthDate,_that.residence,_that.email,_that.password);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignUpInputModel extends SignUpInputModel {
  const _SignUpInputModel({@JsonKey(name: 'first_name', defaultValue: '') required this.firstName, @JsonKey(name: 'last_name', defaultValue: '') required this.lastName, @JsonKey(defaultValue: '') required this.genre, @JsonKey(defaultValue: '') required this.phone, @JsonKey(name: 'annee_naissance', defaultValue: 0) required this.birthDate, @JsonKey(name: 'lieu_residence', defaultValue: '') required this.residence, @JsonKey(defaultValue: '') required this.email, @JsonKey(defaultValue: '') required this.password}): super._();
  factory _SignUpInputModel.fromJson(Map<String, dynamic> json) => _$SignUpInputModelFromJson(json);

@override@JsonKey(name: 'first_name', defaultValue: '') final  String firstName;
@override@JsonKey(name: 'last_name', defaultValue: '') final  String lastName;
@override@JsonKey(defaultValue: '') final  String genre;
@override@JsonKey(defaultValue: '') final  String phone;
@override@JsonKey(name: 'annee_naissance', defaultValue: 0) final  int birthDate;
@override@JsonKey(name: 'lieu_residence', defaultValue: '') final  String residence;
@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(defaultValue: '') final  String password;

/// Create a copy of SignUpInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpInputModelCopyWith<_SignUpInputModel> get copyWith => __$SignUpInputModelCopyWithImpl<_SignUpInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignUpInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpInputModel&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.birthDate, birthDate) || other.birthDate == birthDate)&&(identical(other.residence, residence) || other.residence == residence)&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,firstName,lastName,genre,phone,birthDate,residence,email,password);

@override
String toString() {
  return 'SignUpInputModel(firstName: $firstName, lastName: $lastName, genre: $genre, phone: $phone, birthDate: $birthDate, residence: $residence, email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignUpInputModelCopyWith<$Res> implements $SignUpInputModelCopyWith<$Res> {
  factory _$SignUpInputModelCopyWith(_SignUpInputModel value, $Res Function(_SignUpInputModel) _then) = __$SignUpInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(defaultValue: '') String genre,@JsonKey(defaultValue: '') String phone,@JsonKey(name: 'annee_naissance', defaultValue: 0) int birthDate,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence,@JsonKey(defaultValue: '') String email,@JsonKey(defaultValue: '') String password
});




}
/// @nodoc
class __$SignUpInputModelCopyWithImpl<$Res>
    implements _$SignUpInputModelCopyWith<$Res> {
  __$SignUpInputModelCopyWithImpl(this._self, this._then);

  final _SignUpInputModel _self;
  final $Res Function(_SignUpInputModel) _then;

/// Create a copy of SignUpInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstName = null,Object? lastName = null,Object? genre = null,Object? phone = null,Object? birthDate = null,Object? residence = null,Object? email = null,Object? password = null,}) {
  return _then(_SignUpInputModel(
firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,genre: null == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,birthDate: null == birthDate ? _self.birthDate : birthDate // ignore: cast_nullable_to_non_nullable
as int,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
