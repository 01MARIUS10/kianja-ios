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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(name: 'image_path', defaultValue: '') String get imageUrl;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> get categories; JobLocationModel? get location; JobGenderModel? get gender; JobActorModel? get actor;@JsonKey(name: 'date_limit', defaultValue: '') String get dateLimit;@JsonKey(name: 'status', defaultValue: '') String get status;@JsonKey(name: 'user') UserModel get user;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt;
/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobOfferModelCopyWith<JobOfferModel> get copyWith => _$JobOfferModelCopyWithImpl<JobOfferModel>(this as JobOfferModel, _$identity);

  /// Serializes this JobOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.dateLimit, dateLimit) || other.dateLimit == dateLimit)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,description,const DeepCollectionEquality().hash(categories),location,gender,actor,dateLimit,status,user,createdAt);

@override
String toString() {
  return 'JobOfferModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, categories: $categories, location: $location, gender: $gender, actor: $actor, dateLimit: $dateLimit, status: $status, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $JobOfferModelCopyWith<$Res>  {
  factory $JobOfferModelCopyWith(JobOfferModel value, $Res Function(JobOfferModel) _then) = _$JobOfferModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(name: 'image_path', defaultValue: '') String imageUrl,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories, JobLocationModel? location, JobGenderModel? gender, JobActorModel? actor,@JsonKey(name: 'date_limit', defaultValue: '') String dateLimit,@JsonKey(name: 'status', defaultValue: '') String status,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});


$JobLocationModelCopyWith<$Res>? get location;$JobGenderModelCopyWith<$Res>? get gender;$JobActorModelCopyWith<$Res>? get actor;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$JobOfferModelCopyWithImpl<$Res>
    implements $JobOfferModelCopyWith<$Res> {
  _$JobOfferModelCopyWithImpl(this._self, this._then);

  final JobOfferModel _self;
  final $Res Function(JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? categories = null,Object? location = freezed,Object? gender = freezed,Object? actor = freezed,Object? dateLimit = null,Object? status = null,Object? user = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,dateLimit: null == dateLimit ? _self.dateLimit : dateLimit // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $JobLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobGenderModelCopyWith<$Res>? get gender {
    if (_self.gender == null) {
    return null;
  }

  return $JobGenderModelCopyWith<$Res>(_self.gender!, (value) {
    return _then(_self.copyWith(gender: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobActorModelCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $JobActorModelCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories,  JobLocationModel? location,  JobGenderModel? gender,  JobActorModel? actor, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.dateLimit,_that.status,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories,  JobLocationModel? location,  JobGenderModel? gender,  JobActorModel? actor, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel():
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.dateLimit,_that.status,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories,  JobLocationModel? location,  JobGenderModel? gender,  JobActorModel? actor, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.title,_that.imageUrl,_that.description,_that.categories,_that.location,_that.gender,_that.actor,_that.dateLimit,_that.status,_that.user,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobOfferModel extends JobOfferModel {
  const _JobOfferModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(name: 'image_path', defaultValue: '') required this.imageUrl, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) required final  List<JobCategoryModel> categories, this.location, this.gender, this.actor, @JsonKey(name: 'date_limit', defaultValue: '') required this.dateLimit, @JsonKey(name: 'status', defaultValue: '') required this.status, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt}): _categories = categories,super._();
  factory _JobOfferModel.fromJson(Map<String, dynamic> json) => _$JobOfferModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(name: 'image_path', defaultValue: '') final  String imageUrl;
@override@JsonKey(defaultValue: '') final  String description;
 final  List<JobCategoryModel> _categories;
@override@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  JobLocationModel? location;
@override final  JobGenderModel? gender;
@override final  JobActorModel? actor;
@override@JsonKey(name: 'date_limit', defaultValue: '') final  String dateLimit;
@override@JsonKey(name: 'status', defaultValue: '') final  String status;
@override@JsonKey(name: 'user') final  UserModel user;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.dateLimit, dateLimit) || other.dateLimit == dateLimit)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,imageUrl,description,const DeepCollectionEquality().hash(_categories),location,gender,actor,dateLimit,status,user,createdAt);

@override
String toString() {
  return 'JobOfferModel(id: $id, title: $title, imageUrl: $imageUrl, description: $description, categories: $categories, location: $location, gender: $gender, actor: $actor, dateLimit: $dateLimit, status: $status, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$JobOfferModelCopyWith<$Res> implements $JobOfferModelCopyWith<$Res> {
  factory _$JobOfferModelCopyWith(_JobOfferModel value, $Res Function(_JobOfferModel) _then) = __$JobOfferModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(name: 'image_path', defaultValue: '') String imageUrl,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories, JobLocationModel? location, JobGenderModel? gender, JobActorModel? actor,@JsonKey(name: 'date_limit', defaultValue: '') String dateLimit,@JsonKey(name: 'status', defaultValue: '') String status,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});


@override $JobLocationModelCopyWith<$Res>? get location;@override $JobGenderModelCopyWith<$Res>? get gender;@override $JobActorModelCopyWith<$Res>? get actor;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$JobOfferModelCopyWithImpl<$Res>
    implements _$JobOfferModelCopyWith<$Res> {
  __$JobOfferModelCopyWithImpl(this._self, this._then);

  final _JobOfferModel _self;
  final $Res Function(_JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? imageUrl = null,Object? description = null,Object? categories = null,Object? location = freezed,Object? gender = freezed,Object? actor = freezed,Object? dateLimit = null,Object? status = null,Object? user = null,Object? createdAt = null,}) {
  return _then(_JobOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,dateLimit: null == dateLimit ? _self.dateLimit : dateLimit // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $JobLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobGenderModelCopyWith<$Res>? get gender {
    if (_self.gender == null) {
    return null;
  }

  return $JobGenderModelCopyWith<$Res>(_self.gender!, (value) {
    return _then(_self.copyWith(gender: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobActorModelCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $JobActorModelCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
