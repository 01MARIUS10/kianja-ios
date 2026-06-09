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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get motivation; JobLocationModel get location; JobGenderModel? get gender;@JsonKey(name: 'resumepdf_path') String? get pdfUrl;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt; UserModel get user; JobCategoryModel? get category;
/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantModelCopyWith<JobApplicantModel> get copyWith => _$JobApplicantModelCopyWithImpl<JobApplicantModel>(this as JobApplicantModel, _$identity);

  /// Serializes this JobApplicantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,location,gender,pdfUrl,createdAt,user,category);

@override
String toString() {
  return 'JobApplicantModel(id: $id, title: $title, motivation: $motivation, location: $location, gender: $gender, pdfUrl: $pdfUrl, createdAt: $createdAt, user: $user, category: $category)';
}


}

/// @nodoc
abstract mixin class $JobApplicantModelCopyWith<$Res>  {
  factory $JobApplicantModelCopyWith(JobApplicantModel value, $Res Function(JobApplicantModel) _then) = _$JobApplicantModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String motivation, JobLocationModel location, JobGenderModel? gender,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(name: 'created_at', defaultValue: '') String createdAt, UserModel user, JobCategoryModel? category
});


$JobLocationModelCopyWith<$Res> get location;$JobGenderModelCopyWith<$Res>? get gender;$UserModelCopyWith<$Res> get user;$JobCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class _$JobApplicantModelCopyWithImpl<$Res>
    implements $JobApplicantModelCopyWith<$Res> {
  _$JobApplicantModelCopyWithImpl(this._self, this._then);

  final JobApplicantModel _self;
  final $Res Function(JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? location = null,Object? gender = freezed,Object? pdfUrl = freezed,Object? createdAt = null,Object? user = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JobCategoryModel?,
  ));
}
/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res> get location {
  
  return $JobLocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of JobApplicantModel
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
}/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $JobCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation,  JobLocationModel location,  JobGenderModel? gender, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user,  JobCategoryModel? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.location,_that.gender,_that.pdfUrl,_that.createdAt,_that.user,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation,  JobLocationModel location,  JobGenderModel? gender, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user,  JobCategoryModel? category)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel():
return $default(_that.id,_that.title,_that.motivation,_that.location,_that.gender,_that.pdfUrl,_that.createdAt,_that.user,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String motivation,  JobLocationModel location,  JobGenderModel? gender, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt,  UserModel user,  JobCategoryModel? category)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.location,_that.gender,_that.pdfUrl,_that.createdAt,_that.user,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantModel extends JobApplicantModel {
  const _JobApplicantModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.motivation, required this.location, this.gender, @JsonKey(name: 'resumepdf_path') this.pdfUrl, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt, required this.user, this.category}): super._();
  factory _JobApplicantModel.fromJson(Map<String, dynamic> json) => _$JobApplicantModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String motivation;
@override final  JobLocationModel location;
@override final  JobGenderModel? gender;
@override@JsonKey(name: 'resumepdf_path') final  String? pdfUrl;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;
@override final  UserModel user;
@override final  JobCategoryModel? category;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.location, location) || other.location == location)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.user, user) || other.user == user)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,location,gender,pdfUrl,createdAt,user,category);

@override
String toString() {
  return 'JobApplicantModel(id: $id, title: $title, motivation: $motivation, location: $location, gender: $gender, pdfUrl: $pdfUrl, createdAt: $createdAt, user: $user, category: $category)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantModelCopyWith<$Res> implements $JobApplicantModelCopyWith<$Res> {
  factory _$JobApplicantModelCopyWith(_JobApplicantModel value, $Res Function(_JobApplicantModel) _then) = __$JobApplicantModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String motivation, JobLocationModel location, JobGenderModel? gender,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(name: 'created_at', defaultValue: '') String createdAt, UserModel user, JobCategoryModel? category
});


@override $JobLocationModelCopyWith<$Res> get location;@override $JobGenderModelCopyWith<$Res>? get gender;@override $UserModelCopyWith<$Res> get user;@override $JobCategoryModelCopyWith<$Res>? get category;

}
/// @nodoc
class __$JobApplicantModelCopyWithImpl<$Res>
    implements _$JobApplicantModelCopyWith<$Res> {
  __$JobApplicantModelCopyWithImpl(this._self, this._then);

  final _JobApplicantModel _self;
  final $Res Function(_JobApplicantModel) _then;

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? location = null,Object? gender = freezed,Object? pdfUrl = freezed,Object? createdAt = null,Object? user = null,Object? category = freezed,}) {
  return _then(_JobApplicantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as JobGenderModel?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JobCategoryModel?,
  ));
}

/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res> get location {
  
  return $JobLocationModelCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of JobApplicantModel
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
}/// Create a copy of JobApplicantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $JobCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
