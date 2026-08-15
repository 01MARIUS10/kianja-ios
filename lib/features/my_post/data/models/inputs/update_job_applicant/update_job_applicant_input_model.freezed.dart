// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_job_applicant_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateJobApplicantInputModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'motivation', defaultValue: '') String get motivation;@JsonKey(name: 'photo_candidat', defaultValue: '') String? get photoUrl;@JsonKey(name: 'resumepdf_path', defaultValue: '') String? get pdfUrl;@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories;@JsonKey(name: 'locationsIds', defaultValue: []) List<int> get locations;// @JsonKey(defaultValue: -1) required int locationId,
@JsonKey(defaultValue: -1) int get genderId;// @JsonKey(defaultValue: -1) required int typeId,
// @JsonKey(defaultValue: -1) required int durationId,
// @JsonKey(defaultValue: -1) required int categoryId,
@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of UpdateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateJobApplicantInputModelCopyWith<UpdateJobApplicantInputModel> get copyWith => _$UpdateJobApplicantInputModelCopyWithImpl<UpdateJobApplicantInputModel>(this as UpdateJobApplicantInputModel, _$identity);

  /// Serializes this UpdateJobApplicantInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,photoUrl,pdfUrl,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),genderId,status);

@override
String toString() {
  return 'UpdateJobApplicantInputModel(id: $id, title: $title, motivation: $motivation, photoUrl: $photoUrl, pdfUrl: $pdfUrl, categories: $categories, locations: $locations, genderId: $genderId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateJobApplicantInputModelCopyWith<$Res>  {
  factory $UpdateJobApplicantInputModelCopyWith(UpdateJobApplicantInputModel value, $Res Function(UpdateJobApplicantInputModel) _then) = _$UpdateJobApplicantInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'photo_candidat', defaultValue: '') String? photoUrl,@JsonKey(name: 'resumepdf_path', defaultValue: '') String? pdfUrl,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationsIds', defaultValue: []) List<int> locations,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$UpdateJobApplicantInputModelCopyWithImpl<$Res>
    implements $UpdateJobApplicantInputModelCopyWith<$Res> {
  _$UpdateJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final UpdateJobApplicantInputModel _self;
  final $Res Function(UpdateJobApplicantInputModel) _then;

/// Create a copy of UpdateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? categories = null,Object? locations = null,Object? genderId = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<int>,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateJobApplicantInputModel].
extension UpdateJobApplicantInputModelPatterns on UpdateJobApplicantInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateJobApplicantInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateJobApplicantInputModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateJobApplicantInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat', defaultValue: '')  String? photoUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String? pdfUrl, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.categories,_that.locations,_that.genderId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat', defaultValue: '')  String? photoUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String? pdfUrl, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel():
return $default(_that.id,_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.categories,_that.locations,_that.genderId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'photo_candidat', defaultValue: '')  String? photoUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String? pdfUrl, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.photoUrl,_that.pdfUrl,_that.categories,_that.locations,_that.genderId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateJobApplicantInputModel extends UpdateJobApplicantInputModel {
  const _UpdateJobApplicantInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'motivation', defaultValue: '') required this.motivation, @JsonKey(name: 'photo_candidat', defaultValue: '') this.photoUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '') this.pdfUrl, @JsonKey(name: 'categoryIds', defaultValue: []) required final  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: []) required final  List<int> locations, @JsonKey(defaultValue: -1) required this.genderId, @JsonKey(defaultValue: 'published') required this.status}): _categories = categories,_locations = locations,super._();
  factory _UpdateJobApplicantInputModel.fromJson(Map<String, dynamic> json) => _$UpdateJobApplicantInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'motivation', defaultValue: '') final  String motivation;
@override@JsonKey(name: 'photo_candidat', defaultValue: '') final  String? photoUrl;
@override@JsonKey(name: 'resumepdf_path', defaultValue: '') final  String? pdfUrl;
 final  List<int> _categories;
@override@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<int> _locations;
@override@JsonKey(name: 'locationsIds', defaultValue: []) List<int> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

// @JsonKey(defaultValue: -1) required int locationId,
@override@JsonKey(defaultValue: -1) final  int genderId;
// @JsonKey(defaultValue: -1) required int typeId,
// @JsonKey(defaultValue: -1) required int durationId,
// @JsonKey(defaultValue: -1) required int categoryId,
@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of UpdateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateJobApplicantInputModelCopyWith<_UpdateJobApplicantInputModel> get copyWith => __$UpdateJobApplicantInputModelCopyWithImpl<_UpdateJobApplicantInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateJobApplicantInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,photoUrl,pdfUrl,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),genderId,status);

@override
String toString() {
  return 'UpdateJobApplicantInputModel(id: $id, title: $title, motivation: $motivation, photoUrl: $photoUrl, pdfUrl: $pdfUrl, categories: $categories, locations: $locations, genderId: $genderId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateJobApplicantInputModelCopyWith<$Res> implements $UpdateJobApplicantInputModelCopyWith<$Res> {
  factory _$UpdateJobApplicantInputModelCopyWith(_UpdateJobApplicantInputModel value, $Res Function(_UpdateJobApplicantInputModel) _then) = __$UpdateJobApplicantInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'photo_candidat', defaultValue: '') String? photoUrl,@JsonKey(name: 'resumepdf_path', defaultValue: '') String? pdfUrl,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationsIds', defaultValue: []) List<int> locations,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$UpdateJobApplicantInputModelCopyWithImpl<$Res>
    implements _$UpdateJobApplicantInputModelCopyWith<$Res> {
  __$UpdateJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final _UpdateJobApplicantInputModel _self;
  final $Res Function(_UpdateJobApplicantInputModel) _then;

/// Create a copy of UpdateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? photoUrl = freezed,Object? pdfUrl = freezed,Object? categories = null,Object? locations = null,Object? genderId = null,Object? status = null,}) {
  return _then(_UpdateJobApplicantInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,pdfUrl: freezed == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<int>,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
