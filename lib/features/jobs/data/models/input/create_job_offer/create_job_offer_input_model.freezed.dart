// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_job_offer_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateJobOfferInputModel {

@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'image_id') int? get imageId; List<int>? get imageIds;@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories;@JsonKey(name: 'locationIds', defaultValue: []) List<int> get locationIds;// @JsonKey(defaultValue: -1) required int locationId,
@JsonKey(defaultValue: -1) int get genderId;@JsonKey(defaultValue: -1) int get actorId;@JsonKey(defaultValue: false) bool get showButton;@JsonKey(name: 'date_limit', defaultValue: '') String get limitDate;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of CreateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateJobOfferInputModelCopyWith<CreateJobOfferInputModel> get copyWith => _$CreateJobOfferInputModelCopyWithImpl<CreateJobOfferInputModel>(this as CreateJobOfferInputModel, _$identity);

  /// Serializes this CreateJobOfferInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateJobOfferInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locationIds, locationIds)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.showButton, showButton) || other.showButton == showButton)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,imageId,const DeepCollectionEquality().hash(imageIds),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locationIds),genderId,actorId,showButton,limitDate,status);

@override
String toString() {
  return 'CreateJobOfferInputModel(title: $title, description: $description, imageId: $imageId, imageIds: $imageIds, categories: $categories, locationIds: $locationIds, genderId: $genderId, actorId: $actorId, showButton: $showButton, limitDate: $limitDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateJobOfferInputModelCopyWith<$Res>  {
  factory $CreateJobOfferInputModelCopyWith(CreateJobOfferInputModel value, $Res Function(CreateJobOfferInputModel) _then) = _$CreateJobOfferInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId, List<int>? imageIds,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationIds', defaultValue: []) List<int> locationIds,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: false) bool showButton,@JsonKey(name: 'date_limit', defaultValue: '') String limitDate,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$CreateJobOfferInputModelCopyWithImpl<$Res>
    implements $CreateJobOfferInputModelCopyWith<$Res> {
  _$CreateJobOfferInputModelCopyWithImpl(this._self, this._then);

  final CreateJobOfferInputModel _self;
  final $Res Function(CreateJobOfferInputModel) _then;

/// Create a copy of CreateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? imageId = freezed,Object? imageIds = freezed,Object? categories = null,Object? locationIds = null,Object? genderId = null,Object? actorId = null,Object? showButton = null,Object? limitDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,imageIds: freezed == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locationIds: null == locationIds ? _self.locationIds : locationIds // ignore: cast_nullable_to_non_nullable
as List<int>,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,showButton: null == showButton ? _self.showButton : showButton // ignore: cast_nullable_to_non_nullable
as bool,limitDate: null == limitDate ? _self.limitDate : limitDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateJobOfferInputModel].
extension CreateJobOfferInputModelPatterns on CreateJobOfferInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateJobOfferInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateJobOfferInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateJobOfferInputModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateJobOfferInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateJobOfferInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateJobOfferInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateJobOfferInputModel() when $default != null:
return $default(_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locationIds,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _CreateJobOfferInputModel():
return $default(_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locationIds,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: [])  List<int> locationIds, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreateJobOfferInputModel() when $default != null:
return $default(_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locationIds,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateJobOfferInputModel extends CreateJobOfferInputModel {
  const _CreateJobOfferInputModel({@JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'image_id') this.imageId, final  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: []) required final  List<int> categories, @JsonKey(name: 'locationIds', defaultValue: []) required final  List<int> locationIds, @JsonKey(defaultValue: -1) required this.genderId, @JsonKey(defaultValue: -1) required this.actorId, @JsonKey(defaultValue: false) required this.showButton, @JsonKey(name: 'date_limit', defaultValue: '') required this.limitDate, @JsonKey(defaultValue: 'published') required this.status}): _imageIds = imageIds,_categories = categories,_locationIds = locationIds,super._();
  factory _CreateJobOfferInputModel.fromJson(Map<String, dynamic> json) => _$CreateJobOfferInputModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(name: 'image_id') final  int? imageId;
 final  List<int>? _imageIds;
@override List<int>? get imageIds {
  final value = _imageIds;
  if (value == null) return null;
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<int> _categories;
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

// @JsonKey(defaultValue: -1) required int locationId,
@override@JsonKey(defaultValue: -1) final  int genderId;
@override@JsonKey(defaultValue: -1) final  int actorId;
@override@JsonKey(defaultValue: false) final  bool showButton;
@override@JsonKey(name: 'date_limit', defaultValue: '') final  String limitDate;
@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of CreateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateJobOfferInputModelCopyWith<_CreateJobOfferInputModel> get copyWith => __$CreateJobOfferInputModelCopyWithImpl<_CreateJobOfferInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateJobOfferInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateJobOfferInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locationIds, _locationIds)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.showButton, showButton) || other.showButton == showButton)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,imageId,const DeepCollectionEquality().hash(_imageIds),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locationIds),genderId,actorId,showButton,limitDate,status);

@override
String toString() {
  return 'CreateJobOfferInputModel(title: $title, description: $description, imageId: $imageId, imageIds: $imageIds, categories: $categories, locationIds: $locationIds, genderId: $genderId, actorId: $actorId, showButton: $showButton, limitDate: $limitDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateJobOfferInputModelCopyWith<$Res> implements $CreateJobOfferInputModelCopyWith<$Res> {
  factory _$CreateJobOfferInputModelCopyWith(_CreateJobOfferInputModel value, $Res Function(_CreateJobOfferInputModel) _then) = __$CreateJobOfferInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId, List<int>? imageIds,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationIds', defaultValue: []) List<int> locationIds,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: false) bool showButton,@JsonKey(name: 'date_limit', defaultValue: '') String limitDate,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$CreateJobOfferInputModelCopyWithImpl<$Res>
    implements _$CreateJobOfferInputModelCopyWith<$Res> {
  __$CreateJobOfferInputModelCopyWithImpl(this._self, this._then);

  final _CreateJobOfferInputModel _self;
  final $Res Function(_CreateJobOfferInputModel) _then;

/// Create a copy of CreateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? imageId = freezed,Object? imageIds = freezed,Object? categories = null,Object? locationIds = null,Object? genderId = null,Object? actorId = null,Object? showButton = null,Object? limitDate = null,Object? status = null,}) {
  return _then(_CreateJobOfferInputModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,imageIds: freezed == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locationIds: null == locationIds ? _self._locationIds : locationIds // ignore: cast_nullable_to_non_nullable
as List<int>,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,showButton: null == showButton ? _self.showButton : showButton // ignore: cast_nullable_to_non_nullable
as bool,limitDate: null == limitDate ? _self.limitDate : limitDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
