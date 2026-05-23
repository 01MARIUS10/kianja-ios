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

@JsonKey(defaultValue: -1) int get id;@JsonKey(name: 'title', defaultValue: '') String get title;@JsonKey(name: 'motivation', defaultValue: '') String get motivation;@JsonKey(name: 'image_path', defaultValue: '') String get imageUrl;@JsonKey(name: 'resumepdf_path', defaultValue: '') String get pdfUrl;@JsonKey(defaultValue: -1) int get locationId;@JsonKey(defaultValue: -1) int get genderId;@JsonKey(defaultValue: -1) int get typeId;@JsonKey(defaultValue: -1) int get durationId;@JsonKey(defaultValue: -1) int get categoryId;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of UpdateJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateJobApplicantInputModelCopyWith<UpdateJobApplicantInputModel> get copyWith => _$UpdateJobApplicantInputModelCopyWithImpl<UpdateJobApplicantInputModel>(this as UpdateJobApplicantInputModel, _$identity);

  /// Serializes this UpdateJobApplicantInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,imageUrl,pdfUrl,locationId,genderId,typeId,durationId,categoryId,status);

@override
String toString() {
  return 'UpdateJobApplicantInputModel(id: $id, title: $title, motivation: $motivation, imageUrl: $imageUrl, pdfUrl: $pdfUrl, locationId: $locationId, genderId: $genderId, typeId: $typeId, durationId: $durationId, categoryId: $categoryId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateJobApplicantInputModelCopyWith<$Res>  {
  factory $UpdateJobApplicantInputModelCopyWith(UpdateJobApplicantInputModel value, $Res Function(UpdateJobApplicantInputModel) _then) = _$UpdateJobApplicantInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'image_path', defaultValue: '') String imageUrl,@JsonKey(name: 'resumepdf_path', defaultValue: '') String pdfUrl,@JsonKey(defaultValue: -1) int locationId,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: -1) int categoryId,@JsonKey(defaultValue: 'published') String status
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? imageUrl = null,Object? pdfUrl = null,Object? locationId = null,Object? genderId = null,Object? typeId = null,Object? durationId = null,Object? categoryId = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String pdfUrl, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: -1)  int categoryId, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.imageUrl,_that.pdfUrl,_that.locationId,_that.genderId,_that.typeId,_that.durationId,_that.categoryId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String pdfUrl, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: -1)  int categoryId, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel():
return $default(_that.id,_that.title,_that.motivation,_that.imageUrl,_that.pdfUrl,_that.locationId,_that.genderId,_that.typeId,_that.durationId,_that.categoryId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'title', defaultValue: '')  String title, @JsonKey(name: 'motivation', defaultValue: '')  String motivation, @JsonKey(name: 'image_path', defaultValue: '')  String imageUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '')  String pdfUrl, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: -1)  int categoryId, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.title,_that.motivation,_that.imageUrl,_that.pdfUrl,_that.locationId,_that.genderId,_that.typeId,_that.durationId,_that.categoryId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateJobApplicantInputModel extends UpdateJobApplicantInputModel {
  const _UpdateJobApplicantInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(name: 'title', defaultValue: '') required this.title, @JsonKey(name: 'motivation', defaultValue: '') required this.motivation, @JsonKey(name: 'image_path', defaultValue: '') required this.imageUrl, @JsonKey(name: 'resumepdf_path', defaultValue: '') required this.pdfUrl, @JsonKey(defaultValue: -1) required this.locationId, @JsonKey(defaultValue: -1) required this.genderId, @JsonKey(defaultValue: -1) required this.typeId, @JsonKey(defaultValue: -1) required this.durationId, @JsonKey(defaultValue: -1) required this.categoryId, @JsonKey(defaultValue: 'published') required this.status}): super._();
  factory _UpdateJobApplicantInputModel.fromJson(Map<String, dynamic> json) => _$UpdateJobApplicantInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(name: 'title', defaultValue: '') final  String title;
@override@JsonKey(name: 'motivation', defaultValue: '') final  String motivation;
@override@JsonKey(name: 'image_path', defaultValue: '') final  String imageUrl;
@override@JsonKey(name: 'resumepdf_path', defaultValue: '') final  String pdfUrl;
@override@JsonKey(defaultValue: -1) final  int locationId;
@override@JsonKey(defaultValue: -1) final  int genderId;
@override@JsonKey(defaultValue: -1) final  int typeId;
@override@JsonKey(defaultValue: -1) final  int durationId;
@override@JsonKey(defaultValue: -1) final  int categoryId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.motivation, motivation) || other.motivation == motivation)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,motivation,imageUrl,pdfUrl,locationId,genderId,typeId,durationId,categoryId,status);

@override
String toString() {
  return 'UpdateJobApplicantInputModel(id: $id, title: $title, motivation: $motivation, imageUrl: $imageUrl, pdfUrl: $pdfUrl, locationId: $locationId, genderId: $genderId, typeId: $typeId, durationId: $durationId, categoryId: $categoryId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateJobApplicantInputModelCopyWith<$Res> implements $UpdateJobApplicantInputModelCopyWith<$Res> {
  factory _$UpdateJobApplicantInputModelCopyWith(_UpdateJobApplicantInputModel value, $Res Function(_UpdateJobApplicantInputModel) _then) = __$UpdateJobApplicantInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'title', defaultValue: '') String title,@JsonKey(name: 'motivation', defaultValue: '') String motivation,@JsonKey(name: 'image_path', defaultValue: '') String imageUrl,@JsonKey(name: 'resumepdf_path', defaultValue: '') String pdfUrl,@JsonKey(defaultValue: -1) int locationId,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: -1) int categoryId,@JsonKey(defaultValue: 'published') String status
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? motivation = null,Object? imageUrl = null,Object? pdfUrl = null,Object? locationId = null,Object? genderId = null,Object? typeId = null,Object? durationId = null,Object? categoryId = null,Object? status = null,}) {
  return _then(_UpdateJobApplicantInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,motivation: null == motivation ? _self.motivation : motivation // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
