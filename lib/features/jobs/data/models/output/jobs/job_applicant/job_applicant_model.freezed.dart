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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get motivation;@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> get categories;@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> get locations;// required JobLocationModel location,
 JobGenderModel? get gender;@JsonKey(name: 'photo_candidat') String? get photoUrl;@JsonKey(name: 'resumepdf_path') String? get pdfUrl;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt; UserModel get user;// JobCategoryModel? category,
@JsonKey(defaultValue: false) bool get isFavorite;
/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantModelCopyWith<JobApplicantModel> get copyWith => _$JobApplicantModelCopyWithImpl<JobApplicantModel>(this as JobApplicantModel, _$identity);

  /// Serializes this JobApplicantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),gender,photoUrl,pdfUrl,createdAt,user,isFavorite);

@override
String toString() {
  return 'JobApplicantModel(id: $id, title: $title, motivation: $motivation, categories: $categories, locations: $locations, gender: $gender, photoUrl: $photoUrl, pdfUrl: $pdfUrl, createdAt: $createdAt, user: $user, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $JobApplicantModelCopyWith<$Res>  {
  factory $JobApplicantModelCopyWith(JobApplicantModel value, $Res Function(JobApplicantModel) _then) = _$JobApplicantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String motivation,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories,@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> locations, JobGenderModel? gender,@JsonKey(name: 'photo_candidat') String? photoUrl,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(name: 'created_at', defaultValue: '') String createdAt, UserModel user,@JsonKey(defaultValue: false) bool isFavorite
});


$JobGenderModelCopyWith<$Res>? get gender;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$JobApplicantModelCopyWithImpl<$Res>
    implements $JobApplicantModelCopyWith<$Res> {
  _$JobApplicantModelCopyWithImpl(this._self, this._then);

  final JobApplicantModel _self;
  final $Res Function(JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? categories = null,Object? locations = null,Object? gender = freezed,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? createdAt = null,Object? user = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of JobApplicantModel
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
}/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  JobGenderModel? gender, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.categories,_that.locations,_that.gender,_that.photoUrl,_that.pdfUrl,_that.createdAt,_that.user,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  JobGenderModel? gender, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user, @JsonKey(defaultValue: false)  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel():
return $default(_that.id,_that.title,_that.motivation,_that.categories,_that.locations,_that.gender,_that.photoUrl,_that.pdfUrl,_that.createdAt,_that.user,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[])  List<JobLocationModel> locations,  JobGenderModel? gender, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.categories,_that.locations,_that.gender,_that.photoUrl,_that.pdfUrl,_that.createdAt,_that.user,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantModel extends JobApplicantModel {
  const _JobApplicantModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.motivation, @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) required final  List<JobCategoryModel> categories, @JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) required final  List<JobLocationModel> locations, this.gender, @JsonKey(name: 'photo_candidat') this.photoUrl, @JsonKey(name: 'resumepdf_path') this.pdfUrl, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt, required this.user, @JsonKey(defaultValue: false) required this.isFavorite}): _categories = categories,_locations = locations,super._();
  factory _JobApplicantModel.fromJson(Map<String, dynamic> json) => _$JobApplicantModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String motivation;
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

// required JobLocationModel location,
@override final  JobGenderModel? gender;
@override@JsonKey(name: 'photo_candidat') final  String? photoUrl;
@override@JsonKey(name: 'resumepdf_path') final  String? pdfUrl;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;
@override final  UserModel user;
// JobCategoryModel? category,
@override@JsonKey(defaultValue: false) final  bool isFavorite;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),gender,photoUrl,pdfUrl,createdAt,user,isFavorite);

@override
String toString() {
  return 'JobApplicantModel(id: $id, title: $title, motivation: $motivation, categories: $categories, locations: $locations, gender: $gender, photoUrl: $photoUrl, pdfUrl: $pdfUrl, createdAt: $createdAt, user: $user, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantModelCopyWith<$Res> implements $JobApplicantModelCopyWith<$Res> {
  factory _$JobApplicantModelCopyWith(_JobApplicantModel value, $Res Function(_JobApplicantModel) _then) = __$JobApplicantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String motivation,@JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[]) List<JobCategoryModel> categories,@JsonKey(name: 'locations', defaultValue: <JobLocationModel>[]) List<JobLocationModel> locations, JobGenderModel? gender,@JsonKey(name: 'photo_candidat') String? photoUrl,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(name: 'created_at', defaultValue: '') String createdAt, UserModel user,@JsonKey(defaultValue: false) bool isFavorite
});


@override $JobGenderModelCopyWith<$Res>? get gender;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$JobApplicantModelCopyWithImpl<$Res>
    implements _$JobApplicantModelCopyWith<$Res> {
  __$JobApplicantModelCopyWithImpl(this._self, this._then);

  final _JobApplicantModel _self;
  final $Res Function(_JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? categories = null,Object? locations = null,Object? gender = freezed,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? createdAt = null,Object? user = null,Object? isFavorite = null,}) {
  return _then(_JobApplicantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of JobApplicantModel
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
}/// Create a copy of JobApplicantModel
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
