// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobOfferModel {

 int get id; int get userId; String get userFirstName; String get userLastName; String get userPhoto; String get title; String get imageUrl; String get description; List<String> get categories; String get location; String get gender; String get actor; String get limitDate; String get createdAt;
/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobOfferModelCopyWith<JobOfferModel> get copyWith => _$JobOfferModelCopyWithImpl<JobOfferModel>(this as JobOfferModel, _$identity);

  /// Serializes this JobOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userFirstName, userFirstName) || other.userFirstName == userFirstName)&&(identical(other.userLastName, userLastName) || other.userLastName == userLastName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userFirstName,userLastName,userPhoto,title,imageUrl,description,const DeepCollectionEquality().hash(categories),location,gender,actor,limitDate,createdAt);

@override
String toString() {
  return 'JobOfferModel(id: $id, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, userPhoto: $userPhoto, title: $title, imageUrl: $imageUrl, description: $description, categories: $categories, location: $location, gender: $gender, actor: $actor, limitDate: $limitDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobOfferModelCopyWith<$Res>  {
  factory $JobOfferModelCopyWith(JobOfferModel value, $Res Function(JobOfferModel) _then) = _$JobOfferModelCopyWithImpl;
@useResult
$Res call({
 int id, int userId, String userFirstName, String userLastName, String userPhoto, String title, String imageUrl, String description, List<String> categories, String location, String gender, String actor, String limitDate, String createdAt
});




}
/// @nodoc
class _$JobOfferModelCopyWithImpl<$Res>
    implements $JobOfferModelCopyWith<$Res> {
  _$JobOfferModelCopyWithImpl(this._self, this._then);

  final JobOfferModel _self;
  final $Res Function(JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? userFirstName = null,Object? userLastName = null,Object? userPhoto = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? categories = null,Object? location = null,Object? gender = null,Object? actor = null,Object? limitDate = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userFirstName: null == userFirstName ? _self.userFirstName : userFirstName // ignore: cast_nullable_to_non_nullable
as String,userLastName: null == userLastName ? _self.userLastName : userLastName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,limitDate: null == limitDate ? _self.limitDate : limitDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobOfferModel].
extension JobOfferModelPatterns on JobOfferModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobOfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobOfferModel value)  $default,){
final _that = this;
switch (_that) {
case _JobOfferModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobOfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String imageUrl,  String description,  List<String> categories,  String location,  String gender,  String actor,  String limitDate,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.limitDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String imageUrl,  String description,  List<String> categories,  String location,  String gender,  String actor,  String limitDate,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel():
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.limitDate,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  String userFirstName,  String userLastName,  String userPhoto,  String title,  String imageUrl,  String description,  List<String> categories,  String location,  String gender,  String actor,  String limitDate,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.userId,_that.userFirstName,_that.userLastName,_that.userPhoto,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.limitDate,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobOfferModel extends JobOfferModel {
  const _JobOfferModel({required this.id, required this.userId, required this.userFirstName, required this.userLastName, required this.userPhoto, required this.title, required this.imageUrl, required this.description, required final  List<String> categories, required this.location, required this.gender, required this.actor, required this.limitDate, required this.createdAt}): _categories = categories,super._();
  factory _JobOfferModel.fromJson(Map<String, dynamic> json) => _$JobOfferModelFromJson(json);

@override final  int id;
@override final  int userId;
@override final  String userFirstName;
@override final  String userLastName;
@override final  String userPhoto;
@override final  String title;
@override final  String imageUrl;
@override final  String description;
 final  List<String> _categories;
@override List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  String location;
@override final  String gender;
@override final  String actor;
@override final  String limitDate;
@override final  String createdAt;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobOfferModelCopyWith<_JobOfferModel> get copyWith => __$JobOfferModelCopyWithImpl<_JobOfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobOfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userFirstName, userFirstName) || other.userFirstName == userFirstName)&&(identical(other.userLastName, userLastName) || other.userLastName == userLastName)&&(identical(other.userPhoto, userPhoto) || other.userPhoto == userPhoto)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,userFirstName,userLastName,userPhoto,title,imageUrl,description,const DeepCollectionEquality().hash(_categories),location,gender,actor,limitDate,createdAt);

@override
String toString() {
  return 'JobOfferModel(id: $id, userId: $userId, userFirstName: $userFirstName, userLastName: $userLastName, userPhoto: $userPhoto, title: $title, imageUrl: $imageUrl, description: $description, categories: $categories, location: $location, gender: $gender, actor: $actor, limitDate: $limitDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobOfferModelCopyWith<$Res> implements $JobOfferModelCopyWith<$Res> {
  factory _$JobOfferModelCopyWith(_JobOfferModel value, $Res Function(_JobOfferModel) _then) = __$JobOfferModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, String userFirstName, String userLastName, String userPhoto, String title, String imageUrl, String description, List<String> categories, String location, String gender, String actor, String limitDate, String createdAt
});




}
/// @nodoc
class __$JobOfferModelCopyWithImpl<$Res>
    implements _$JobOfferModelCopyWith<$Res> {
  __$JobOfferModelCopyWithImpl(this._self, this._then);

  final _JobOfferModel _self;
  final $Res Function(_JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? userFirstName = null,Object? userLastName = null,Object? userPhoto = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? categories = null,Object? location = null,Object? gender = null,Object? actor = null,Object? limitDate = null,Object? createdAt = null,}) {
  return _then(_JobOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,userFirstName: null == userFirstName ? _self.userFirstName : userFirstName // ignore: cast_nullable_to_non_nullable
as String,userLastName: null == userLastName ? _self.userLastName : userLastName // ignore: cast_nullable_to_non_nullable
as String,userPhoto: null == userPhoto ? _self.userPhoto : userPhoto // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,actor: null == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as String,limitDate: null == limitDate ? _self.limitDate : limitDate // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
