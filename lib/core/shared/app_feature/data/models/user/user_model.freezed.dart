// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

@JsonKey(name: 'user_id', defaultValue: -1) int get id;@JsonKey(name: 'first_name', defaultValue: '') String get firstName;@JsonKey(name: 'last_name', defaultValue: '') String get lastName;@JsonKey(name: 'photo', defaultValue: '') String get photoUrl;@JsonKey(name: 'cv_url', defaultValue: '') String get cvUrl;@JsonKey(defaultValue: '') String get phone;@JsonKey(defaultValue: '') String get email;@JsonKey(name: 'lieu_residence', defaultValue: '') String get residence;@JsonKey(name: 'date_candidature', defaultValue: '') String get dateCandidature;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.residence, residence) || other.residence == residence)&&(identical(other.dateCandidature, dateCandidature) || other.dateCandidature == dateCandidature)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,photoUrl,cvUrl,phone,email,residence,dateCandidature,createdAt);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, cvUrl: $cvUrl, phone: $phone, email: $email, residence: $residence, dateCandidature: $dateCandidature, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id', defaultValue: -1) int id,@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(name: 'photo', defaultValue: '') String photoUrl,@JsonKey(name: 'cv_url', defaultValue: '') String cvUrl,@JsonKey(defaultValue: '') String phone,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence,@JsonKey(name: 'date_candidature', defaultValue: '') String dateCandidature,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? photoUrl = null,Object? cvUrl = null,Object? phone = null,Object? email = null,Object? residence = null,Object? dateCandidature = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,cvUrl: null == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,dateCandidature: null == dateCandidature ? _self.dateCandidature : dateCandidature // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', defaultValue: -1)  int id, @JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(name: 'photo', defaultValue: '')  String photoUrl, @JsonKey(name: 'cv_url', defaultValue: '')  String cvUrl, @JsonKey(defaultValue: '')  String phone, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(name: 'date_candidature', defaultValue: '')  String dateCandidature, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.cvUrl,_that.phone,_that.email,_that.residence,_that.dateCandidature,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id', defaultValue: -1)  int id, @JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(name: 'photo', defaultValue: '')  String photoUrl, @JsonKey(name: 'cv_url', defaultValue: '')  String cvUrl, @JsonKey(defaultValue: '')  String phone, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(name: 'date_candidature', defaultValue: '')  String dateCandidature, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.cvUrl,_that.phone,_that.email,_that.residence,_that.dateCandidature,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id', defaultValue: -1)  int id, @JsonKey(name: 'first_name', defaultValue: '')  String firstName, @JsonKey(name: 'last_name', defaultValue: '')  String lastName, @JsonKey(name: 'photo', defaultValue: '')  String photoUrl, @JsonKey(name: 'cv_url', defaultValue: '')  String cvUrl, @JsonKey(defaultValue: '')  String phone, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'lieu_residence', defaultValue: '')  String residence, @JsonKey(name: 'date_candidature', defaultValue: '')  String dateCandidature, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.cvUrl,_that.phone,_that.email,_that.residence,_that.dateCandidature,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({@JsonKey(name: 'user_id', defaultValue: -1) required this.id, @JsonKey(name: 'first_name', defaultValue: '') required this.firstName, @JsonKey(name: 'last_name', defaultValue: '') required this.lastName, @JsonKey(name: 'photo', defaultValue: '') required this.photoUrl, @JsonKey(name: 'cv_url', defaultValue: '') required this.cvUrl, @JsonKey(defaultValue: '') required this.phone, @JsonKey(defaultValue: '') required this.email, @JsonKey(name: 'lieu_residence', defaultValue: '') required this.residence, @JsonKey(name: 'date_candidature', defaultValue: '') required this.dateCandidature, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: 'user_id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'first_name', defaultValue: '') final  String firstName;
@override@JsonKey(name: 'last_name', defaultValue: '') final  String lastName;
@override@JsonKey(name: 'photo', defaultValue: '') final  String photoUrl;
@override@JsonKey(name: 'cv_url', defaultValue: '') final  String cvUrl;
@override@JsonKey(defaultValue: '') final  String phone;
@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(name: 'lieu_residence', defaultValue: '') final  String residence;
@override@JsonKey(name: 'date_candidature', defaultValue: '') final  String dateCandidature;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.cvUrl, cvUrl) || other.cvUrl == cvUrl)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.residence, residence) || other.residence == residence)&&(identical(other.dateCandidature, dateCandidature) || other.dateCandidature == dateCandidature)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,photoUrl,cvUrl,phone,email,residence,dateCandidature,createdAt);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, cvUrl: $cvUrl, phone: $phone, email: $email, residence: $residence, dateCandidature: $dateCandidature, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id', defaultValue: -1) int id,@JsonKey(name: 'first_name', defaultValue: '') String firstName,@JsonKey(name: 'last_name', defaultValue: '') String lastName,@JsonKey(name: 'photo', defaultValue: '') String photoUrl,@JsonKey(name: 'cv_url', defaultValue: '') String cvUrl,@JsonKey(defaultValue: '') String phone,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'lieu_residence', defaultValue: '') String residence,@JsonKey(name: 'date_candidature', defaultValue: '') String dateCandidature,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? photoUrl = null,Object? cvUrl = null,Object? phone = null,Object? email = null,Object? residence = null,Object? dateCandidature = null,Object? createdAt = null,}) {
  return _then(_UserModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: null == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String,cvUrl: null == cvUrl ? _self.cvUrl : cvUrl // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,residence: null == residence ? _self.residence : residence // ignore: cast_nullable_to_non_nullable
as String,dateCandidature: null == dateCandidature ? _self.dateCandidature : dateCandidature // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
