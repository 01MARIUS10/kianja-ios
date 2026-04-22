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

 int get id; int get userId; String get userFirstName; String get userLastName; String get userPhoto; String get title; String get motivation; List<String> get categories; String get location; String get gender; String get pdfUrl; String get createdAt;
/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantModelCopyWith<JobApplicantModel> get copyWith => _$JobApplicantModelCopyWithImpl<JobApplicantModel>(this as JobApplicantModel, _$identity);

  /// Serializes this JobApplicantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userFirstName, userFirstName) || other.userFirstName == userFirstName)&&(identical(other.userLastName, userLastName) || other.userLastName == userLastName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userFirstName,userLastName,userPhoto,title,motivation,const DeepCollectionEquality().hash(categories),location,gender,pdfUrl,createdAt);

@override
String toString() {
  return 'JobApplicantModel(id: $id, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, userPhoto: $userPhoto, title: $title, motivation: $motivation, categories: $categories, location: $location, gender: $gender, pdfUrl: $pdfUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobApplicantModelCopyWith<$Res>  {
  factory $JobApplicantModelCopyWith(JobApplicantModel value, $Res Function(JobApplicantModel) _then) = _$JobApplicantModelCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String userFirstName, String userLastName, String userPhoto, String title, String motivation, List<String> categories, String location, String gender, String pdfUrl, String createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userFirstName = null,Object? userLastName = null,Object? userPhoto = null,Object? title = null,Object? motivation = null,Object? categories = null,Object? location = null,Object? gender = null,Object? pdfUrl = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userFirstName: null == userFirstName ? _self.userFirstName : userFirstName // ignore: cast_nullable_to_non_nullable
as String,userLastName: null == userLastName ? _self.userLastName : userLastName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String motivation,  List<String> categories,  String location,  String gender,  String pdfUrl,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.motivation,_that.categories,_that.location,_that.gender,_that.pdfUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String motivation,  List<String> categories,  String location,  String gender,  String pdfUrl,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel():
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.motivation,_that.categories,_that.location,_that.gender,_that.pdfUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String motivation,  List<String> categories,  String location,  String gender,  String pdfUrl,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.motivation,_that.categories,_that.location,_that.gender,_that.pdfUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantModel extends JobApplicantModel {
  const _JobApplicantModel({required this.id, required this.userId, required this.userFirstName, required this.userLastName, required this.userPhoto, required this.title, required this.motivation, required final  List<String> categories, required this.location, required this.gender, required this.pdfUrl, required this.createdAt}): _categories = categories,super._();
  factory _JobApplicantModel.fromJson(Map<String, dynamic> json) => _$JobApplicantModelFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String userFirstName;
@override final  String userLastName;
@override final  String userPhoto;
@override final  String title;
@override final  String motivation;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String location;
@override final  String gender;
@override final  String pdfUrl;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userFirstName, userFirstName) || other.userFirstName == userFirstName)&&(identical(other.userLastName, userLastName) || other.userLastName == userLastName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userFirstName,userLastName,userPhoto,title,motivation,const DeepCollectionEquality().hash(_categories),location,gender,pdfUrl,createdAt);

@override
String toString() {
  return 'JobApplicantModel(id: $id, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, userPhoto: $userPhoto, title: $title, motivation: $motivation, categories: $categories, location: $location, gender: $gender, pdfUrl: $pdfUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantModelCopyWith<$Res> implements $JobApplicantModelCopyWith<$Res> {
  factory _$JobApplicantModelCopyWith(_JobApplicantModel value, $Res Function(_JobApplicantModel) _then) = __$JobApplicantModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String userFirstName, String userLastName, String userPhoto, String title, String motivation, List<String> categories, String location, String gender, String pdfUrl, String createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userFirstName = null,Object? userLastName = null,Object? userPhoto = null,Object? title = null,Object? motivation = null,Object? categories = null,Object? location = null,Object? gender = null,Object? pdfUrl = null,Object? createdAt = null,}) {
  return _then(_JobApplicantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userFirstName: null == userFirstName ? _self.userFirstName : userFirstName // ignore: cast_nullable_to_non_nullable
as String,userLastName: null == userLastName ? _self.userLastName : userLastName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
