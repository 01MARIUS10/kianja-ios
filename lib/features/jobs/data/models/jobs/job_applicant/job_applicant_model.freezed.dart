// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_applicant_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobApplicantModel {

 int get id; int get userId; String get firstName; String get lastName; String get photo; String get title; String get description; String get createdAt;
/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantModelCopyWith<JobApplicantModel> get copyWith => _$JobApplicantModelCopyWithImpl<JobApplicantModel>(this as JobApplicantModel, _$identity);

  /// Serializes this JobApplicantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,firstName,lastName,photo,title,description,createdAt);

@override
String toString() {
  return 'JobApplicantModel(id: $id, userId: $userId, firstName: $firstName, lastName: $lastName, photo: $photo, title: $title, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobApplicantModelCopyWith<$Res>  {
  factory $JobApplicantModelCopyWith(JobApplicantModel value, $Res Function(JobApplicantModel) _then) = _$JobApplicantModelCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String firstName, String lastName, String photo, String title, String description, String createdAt
});




}
/// @nodoc
class _$JobApplicantModelCopyWithImpl<$Res>
    implements $JobApplicantModelCopyWith<$Res> {
  _$JobApplicantModelCopyWithImpl(this._self, this._then);

  final JobApplicantModel _self;
  final $Res Function(JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? firstName = null,Object? lastName = null,Object? photo = null,Object? title = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobApplicantModel].
extension JobApplicantModelPatterns on JobApplicantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicantModel value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicantModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String firstName,  String lastName,  String photo,  String title,  String description,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.userId,_that.firstName,_that.lastName,_that.photo,_that.title,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String firstName,  String lastName,  String photo,  String title,  String description,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel():
return $default(_that.id,_that.userId,_that.firstName,_that.lastName,_that.photo,_that.title,_that.description,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String firstName,  String lastName,  String photo,  String title,  String description,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.userId,_that.firstName,_that.lastName,_that.photo,_that.title,_that.description,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantModel extends JobApplicantModel {
  const _JobApplicantModel({required this.id, required this.userId, required this.firstName, required this.lastName, required this.photo, required this.title, required this.description, required this.createdAt}): super._();
  factory _JobApplicantModel.fromJson(Map<String, dynamic> json) => _$JobApplicantModelFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String firstName;
@override final  String lastName;
@override final  String photo;
@override final  String title;
@override final  String description;
@override final  String createdAt;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobApplicantModelCopyWith<_JobApplicantModel> get copyWith => __$JobApplicantModelCopyWithImpl<_JobApplicantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobApplicantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,firstName,lastName,photo,title,description,createdAt);

@override
String toString() {
  return 'JobApplicantModel(id: $id, userId: $userId, firstName: $firstName, lastName: $lastName, photo: $photo, title: $title, description: $description, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantModelCopyWith<$Res> implements $JobApplicantModelCopyWith<$Res> {
  factory _$JobApplicantModelCopyWith(_JobApplicantModel value, $Res Function(_JobApplicantModel) _then) = __$JobApplicantModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String firstName, String lastName, String photo, String title, String description, String createdAt
});




}
/// @nodoc
class __$JobApplicantModelCopyWithImpl<$Res>
    implements _$JobApplicantModelCopyWith<$Res> {
  __$JobApplicantModelCopyWithImpl(this._self, this._then);

  final _JobApplicantModel _self;
  final $Res Function(_JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? firstName = null,Object? lastName = null,Object? photo = null,Object? title = null,Object? description = null,Object? createdAt = null,}) {
  return _then(_JobApplicantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
