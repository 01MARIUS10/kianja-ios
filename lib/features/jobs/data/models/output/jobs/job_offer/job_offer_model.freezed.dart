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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> get categories;@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> get locations; List<JobImageModel>? get images; JobImageModel? get image;// JobLocationModel? location,
 JobGenderModel? get gender; JobActorModel? get actor; JobPreferenceModel? get preference;@JsonKey(name: 'date_limit', defaultValue: '') String get dateLimit;@JsonKey(name: 'candidats_count', defaultValue: 0) int get candidatsCount;@JsonKey(name: 'status', defaultValue: '') String get status;@JsonKey(name: 'user') UserModel get user;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt;@JsonKey(defaultValue: false) bool get isFavorite;@JsonKey(defaultValue: false) bool get alreadyPostuler;
/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobOfferModelCopyWith<JobOfferModel> get copyWith => _$JobOfferModelCopyWithImpl<JobOfferModel>(this as JobOfferModel, _$identity);

  /// Serializes this JobOfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.image, image) || other.image == image)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.preference, preference) || other.preference == preference)&&(identical(other.dateLimit, dateLimit) || other.dateLimit == dateLimit)&&(identical(other.candidatsCount, candidatsCount) || other.candidatsCount == candidatsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.alreadyPostuler, alreadyPostuler) || other.alreadyPostuler == alreadyPostuler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(images),image,gender,actor,preference,dateLimit,candidatsCount,status,user,createdAt,isFavorite,alreadyPostuler);

@override
String toString() {
  return 'JobOfferModel(id: $id, title: $title, description: $description, categories: $categories, locations: $locations, images: $images, image: $image, gender: $gender, actor: $actor, preference: $preference, dateLimit: $dateLimit, candidatsCount: $candidatsCount, status: $status, user: $user, createdAt: $createdAt, isFavorite: $isFavorite, alreadyPostuler: $alreadyPostuler)';
}


}

/// @nodoc
abstract mixin class $JobOfferModelCopyWith<$Res>  {
  factory $JobOfferModelCopyWith(JobOfferModel value, $Res Function(JobOfferModel) _then) = _$JobOfferModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories,@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> locations, List<JobImageModel>? images, JobImageModel? image, JobGenderModel? gender, JobActorModel? actor, JobPreferenceModel? preference,@JsonKey(name: 'date_limit', defaultValue: '') String dateLimit,@JsonKey(name: 'candidats_count', defaultValue: 0) int candidatsCount,@JsonKey(name: 'status', defaultValue: '') String status,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt,@JsonKey(defaultValue: false) bool isFavorite,@JsonKey(defaultValue: false) bool alreadyPostuler
});


$JobImageModelCopyWith<$Res>? get image;$JobGenderModelCopyWith<$Res>? get gender;$JobActorModelCopyWith<$Res>? get actor;$JobPreferenceModelCopyWith<$Res>? get preference;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$JobOfferModelCopyWithImpl<$Res>
    implements $JobOfferModelCopyWith<$Res> {
  _$JobOfferModelCopyWithImpl(this._self, this._then);

  final JobOfferModel _self;
  final $Res Function(JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? categories = null,Object? locations = null,Object? images = freezed,Object? image = freezed,Object? gender = freezed,Object? actor = freezed,Object? preference = freezed,Object? dateLimit = null,Object? candidatsCount = null,Object? status = null,Object? user = null,Object? createdAt = null,Object? isFavorite = null,Object? alreadyPostuler = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as JobImageModel?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,preference: freezed == preference ? _self.preference : preference // ignore: cast_nullable_to_non_nullable
as JobPreferenceModel?,dateLimit: null == dateLimit ? _self.dateLimit : dateLimit // ignore: cast_nullable_to_non_nullable
as String,candidatsCount: null == candidatsCount ? _self.candidatsCount : candidatsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,alreadyPostuler: null == alreadyPostuler ? _self.alreadyPostuler : alreadyPostuler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $JobImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
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
$JobPreferenceModelCopyWith<$Res>? get preference {
    if (_self.preference == null) {
    return null;
  }

  return $JobPreferenceModelCopyWith<$Res>(_self.preference!, (value) {
    return _then(_self.copyWith(preference: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  List<JobImageModel>? images,  JobImageModel? image,  JobGenderModel? gender,  JobActorModel? actor,  JobPreferenceModel? preference, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'candidats_count', defaultValue: 0)  int candidatsCount, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite, @JsonKey(defaultValue: false)  bool alreadyPostuler)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.categories,_that.locations,_that.images,_that.image,_that.gender,_that.actor,_that.preference,_that.dateLimit,_that.candidatsCount,_that.status,_that.user,_that.createdAt,_that.isFavorite,_that.alreadyPostuler);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  List<JobImageModel>? images,  JobImageModel? image,  JobGenderModel? gender,  JobActorModel? actor,  JobPreferenceModel? preference, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'candidats_count', defaultValue: 0)  int candidatsCount, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite, @JsonKey(defaultValue: false)  bool alreadyPostuler)  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel():
return $default(_that.id,_that.title,_that.description,_that.categories,_that.locations,_that.images,_that.image,_that.gender,_that.actor,_that.preference,_that.dateLimit,_that.candidatsCount,_that.status,_that.user,_that.createdAt,_that.isFavorite,_that.alreadyPostuler);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  List<JobImageModel>? images,  JobImageModel? image,  JobGenderModel? gender,  JobActorModel? actor,  JobPreferenceModel? preference, @JsonKey(name: 'date_limit', defaultValue: '')  String dateLimit, @JsonKey(name: 'candidats_count', defaultValue: 0)  int candidatsCount, @JsonKey(name: 'status', defaultValue: '')  String status, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite, @JsonKey(defaultValue: false)  bool alreadyPostuler)?  $default,) {final _that = this;
switch (_that) {
case _JobOfferModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.categories,_that.locations,_that.images,_that.image,_that.gender,_that.actor,_that.preference,_that.dateLimit,_that.candidatsCount,_that.status,_that.user,_that.createdAt,_that.isFavorite,_that.alreadyPostuler);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobOfferModel extends JobOfferModel {
  const _JobOfferModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) required final  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) required final  List<JobLocationModel> locations, final  List<JobImageModel>? images, this.image, this.gender, this.actor, this.preference, @JsonKey(name: 'date_limit', defaultValue: '') required this.dateLimit, @JsonKey(name: 'candidats_count', defaultValue: 0) required this.candidatsCount, @JsonKey(name: 'status', defaultValue: '') required this.status, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt, @JsonKey(defaultValue: false) required this.isFavorite, @JsonKey(defaultValue: false) required this.alreadyPostuler}): _categories = categories,_locations = locations,_images = images,super._();
  factory _JobOfferModel.fromJson(Map<String, dynamic> json) => _$JobOfferModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String description;
 final  List<JobCategoryModel> _categories;
@override@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<JobLocationModel> _locations;
@override@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<JobImageModel>? _images;
@override List<JobImageModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  JobImageModel? image;
// JobLocationModel? location,
@override final  JobGenderModel? gender;
@override final  JobActorModel? actor;
@override final  JobPreferenceModel? preference;
@override@JsonKey(name: 'date_limit', defaultValue: '') final  String dateLimit;
@override@JsonKey(name: 'candidats_count', defaultValue: 0) final  int candidatsCount;
@override@JsonKey(name: 'status', defaultValue: '') final  String status;
@override@JsonKey(name: 'user') final  UserModel user;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;
@override@JsonKey(defaultValue: false) final  bool isFavorite;
@override@JsonKey(defaultValue: false) final  bool alreadyPostuler;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobOfferModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.image, image) || other.image == image)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.preference, preference) || other.preference == preference)&&(identical(other.dateLimit, dateLimit) || other.dateLimit == dateLimit)&&(identical(other.candidatsCount, candidatsCount) || other.candidatsCount == candidatsCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.alreadyPostuler, alreadyPostuler) || other.alreadyPostuler == alreadyPostuler));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_images),image,gender,actor,preference,dateLimit,candidatsCount,status,user,createdAt,isFavorite,alreadyPostuler);

@override
String toString() {
  return 'JobOfferModel(id: $id, title: $title, description: $description, categories: $categories, locations: $locations, images: $images, image: $image, gender: $gender, actor: $actor, preference: $preference, dateLimit: $dateLimit, candidatsCount: $candidatsCount, status: $status, user: $user, createdAt: $createdAt, isFavorite: $isFavorite, alreadyPostuler: $alreadyPostuler)';
}


}

/// @nodoc
abstract mixin class _$JobOfferModelCopyWith<$Res> implements $JobOfferModelCopyWith<$Res> {
  factory _$JobOfferModelCopyWith(_JobOfferModel value, $Res Function(_JobOfferModel) _then) = __$JobOfferModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories,@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> locations, List<JobImageModel>? images, JobImageModel? image, JobGenderModel? gender, JobActorModel? actor, JobPreferenceModel? preference,@JsonKey(name: 'date_limit', defaultValue: '') String dateLimit,@JsonKey(name: 'candidats_count', defaultValue: 0) int candidatsCount,@JsonKey(name: 'status', defaultValue: '') String status,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt,@JsonKey(defaultValue: false) bool isFavorite,@JsonKey(defaultValue: false) bool alreadyPostuler
});


@override $JobImageModelCopyWith<$Res>? get image;@override $JobGenderModelCopyWith<$Res>? get gender;@override $JobActorModelCopyWith<$Res>? get actor;@override $JobPreferenceModelCopyWith<$Res>? get preference;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$JobOfferModelCopyWithImpl<$Res>
    implements _$JobOfferModelCopyWith<$Res> {
  __$JobOfferModelCopyWithImpl(this._self, this._then);

  final _JobOfferModel _self;
  final $Res Function(_JobOfferModel) _then;

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? categories = null,Object? locations = null,Object? images = freezed,Object? image = freezed,Object? gender = freezed,Object? actor = freezed,Object? preference = freezed,Object? dateLimit = null,Object? candidatsCount = null,Object? status = null,Object? user = null,Object? createdAt = null,Object? isFavorite = null,Object? alreadyPostuler = null,}) {
  return _then(_JobOfferModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as JobImageModel?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,preference: freezed == preference ? _self.preference : preference // ignore: cast_nullable_to_non_nullable
as JobPreferenceModel?,dateLimit: null == dateLimit ? _self.dateLimit : dateLimit // ignore: cast_nullable_to_non_nullable
as String,candidatsCount: null == candidatsCount ? _self.candidatsCount : candidatsCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,alreadyPostuler: null == alreadyPostuler ? _self.alreadyPostuler : alreadyPostuler // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of JobOfferModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $JobImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
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
$JobPreferenceModelCopyWith<$Res>? get preference {
    if (_self.preference == null) {
    return null;
  }

  return $JobPreferenceModelCopyWith<$Res>(_self.preference!, (value) {
    return _then(_self.copyWith(preference: value));
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
