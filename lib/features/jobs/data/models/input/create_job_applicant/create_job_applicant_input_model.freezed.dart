// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_job_applicant_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateJobApplicantInputModel {

@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'motivation', defaultValue: '') String get motivation;@JsonKey(name: 'photo_candidat') String? get photoUrl;@JsonKey(name: 'resumepdf_path') String? get pdfUrl;// @JsonKey(defaultValue: -1) required int locationId,
@JsonKey(defaultValue: -1) int get genderId;@JsonKey(defaultValue: -1) int get typeId;@JsonKey(defaultValue: -1) int get durationId;// @JsonKey(defaultValue: -1) required int categoryId,
@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories;@JsonKey(name: 'locationIds', defaultValue: []) List<int> get locationIds;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of CreateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateJobApplicantInputModelCopyWith<CreateJobApplicantInputModel> get copyWith => _$CreateJobApplicantInputModelCopyWithImpl<CreateJobApplicantInputModel>(this as CreateJobApplicantInputModel, _$identity);

  /// Serializes this CreateJobApplicantInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateJobApplicantInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locationIds, locationIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,motivation,photoUrl,pdfUrl,genderId,typeId,durationId,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locationIds),status);

@override
String toString() {
  return 'CreateJobApplicantInputModel(title: $title, motivation: $motivation, photoUrl: $photoUrl, pdfUrl: $pdfUrl, genderId: $genderId, typeId: $typeId, durationId: $durationId, categories: $categories, locationIds: $locationIds, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateJobApplicantInputModelCopyWith<$Res>  {
  factory $CreateJobApplicantInputModelCopyWith(CreateJobApplicantInputModel value, $Res Function(CreateJobApplicantInputModel) _then) = _$CreateJobApplicantInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'photo_candidat') String? photoUrl,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationIds', defaultValue: []) List<int> locationIds,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$CreateJobApplicantInputModelCopyWithImpl<$Res>
    implements $CreateJobApplicantInputModelCopyWith<$Res> {
  _$CreateJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final CreateJobApplicantInputModel _self;
  final $Res Function(CreateJobApplicantInputModel) _then;

/// Create a copy of CreateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? motivation = null,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? genderId = null,Object? typeId = null,Object? durationId = null,Object? categories = null,Object? locationIds = null,Object? status = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locationIds: null == locationIds ? _self.locationIds : locationIds // ignore: cast_nullable_to_non_nullable
as List<int>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateJobApplicantInputModel].
extension CreateJobApplicantInputModelPatterns on CreateJobApplicantInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateJobApplicantInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateJobApplicantInputModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateJobApplicantInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel() when $default != null:
return $default(_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.genderId,_that.typeId,_that.durationId,_that.categories,_that.locationIds,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel():
return $default(_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.genderId,_that.typeId,_that.durationId,_that.categories,_that.locationIds,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat')  String? photoUrl, @JsonKey(name: 'resumepdf_path')  String? pdfUrl, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreateJobApplicantInputModel() when $default != null:
return $default(_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.genderId,_that.typeId,_that.durationId,_that.categories,_that.locationIds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateJobApplicantInputModel extends CreateJobApplicantInputModel {
  const _CreateJobApplicantInputModel({@JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'motivation', defaultValue: '') required this.motivation, @JsonKey(name: 'photo_candidat') this.photoUrl, @JsonKey(name: 'resumepdf_path') this.pdfUrl, @JsonKey(defaultValue: -1) required this.genderId, @JsonKey(defaultValue: -1) required this.typeId, @JsonKey(defaultValue: -1) required this.durationId, @JsonKey(name: 'categoryIds', defaultValue: []) required final  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: []) required final  List<int> locationIds, @JsonKey(defaultValue: 'published') required this.status}): _categories = categories,_locationIds = locationIds,super._();
  factory _CreateJobApplicantInputModel.fromJson(Map<String, dynamic> json) => _$CreateJobApplicantInputModelFromJson(json);

@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'motivation', defaultValue: '') final  String motivation;
@override@JsonKey(name: 'photo_candidat') final  String? photoUrl;
@override@JsonKey(name: 'resumepdf_path') final  String? pdfUrl;
// @JsonKey(defaultValue: -1) required int locationId,
@override@JsonKey(defaultValue: -1) final  int genderId;
@override@JsonKey(defaultValue: -1) final  int typeId;
@override@JsonKey(defaultValue: -1) final  int durationId;
// @JsonKey(defaultValue: -1) required int categoryId,
 final  List<int> _categories;
// @JsonKey(defaultValue: -1) required int categoryId,
@override@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<int> _locationIds;
@override@JsonKey(name: 'locationIds', defaultValue: []) List<int> get locationIds {
  if (_locationIds is EqualUnmodifiableListView) return _locationIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locationIds);
}

@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of CreateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateJobApplicantInputModelCopyWith<_CreateJobApplicantInputModel> get copyWith => __$CreateJobApplicantInputModelCopyWithImpl<_CreateJobApplicantInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateJobApplicantInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateJobApplicantInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locationIds, _locationIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,motivation,photoUrl,pdfUrl,genderId,typeId,durationId,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locationIds),status);

@override
String toString() {
  return 'CreateJobApplicantInputModel(title: $title, motivation: $motivation, photoUrl: $photoUrl, pdfUrl: $pdfUrl, genderId: $genderId, typeId: $typeId, durationId: $durationId, categories: $categories, locationIds: $locationIds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateJobApplicantInputModelCopyWith<$Res> implements $CreateJobApplicantInputModelCopyWith<$Res> {
  factory _$CreateJobApplicantInputModelCopyWith(_CreateJobApplicantInputModel value, $Res Function(_CreateJobApplicantInputModel) _then) = __$CreateJobApplicantInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'photo_candidat') String? photoUrl,@JsonKey(name: 'resumepdf_path') String? pdfUrl,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationIds', defaultValue: []) List<int> locationIds,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$CreateJobApplicantInputModelCopyWithImpl<$Res>
    implements _$CreateJobApplicantInputModelCopyWith<$Res> {
  __$CreateJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final _CreateJobApplicantInputModel _self;
  final $Res Function(_CreateJobApplicantInputModel) _then;

/// Create a copy of CreateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? motivation = null,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? genderId = null,Object? typeId = null,Object? durationId = null,Object? categories = null,Object? locationIds = null,Object? status = null,}) {
  return _then(_CreateJobApplicantInputModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locationIds: null == locationIds ? _self._locationIds : locationIds // ignore: cast_nullable_to_non_nullable
as List<int>,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
