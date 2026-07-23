// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_job_offer_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateJobOfferInputModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'image_id') int? get imageId; List<int>? get imageIds;@JsonKey(name: 'categoryIds', defaultValue: []) List<int> get categories;@JsonKey(name: 'locationsIds', defaultValue: []) List<int> get locations;// @JsonKey(defaultValue: -1) required int locationId,
@JsonKey(defaultValue: -1) int get genderId;@JsonKey(defaultValue: -1) int get actorId;@JsonKey(defaultValue: false) bool get showButton;@JsonKey(name: 'date_limit', defaultValue: '') String get limitDate;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of UpdateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateJobOfferInputModelCopyWith<UpdateJobOfferInputModel> get copyWith => _$UpdateJobOfferInputModelCopyWithImpl<UpdateJobOfferInputModel>(this as UpdateJobOfferInputModel, _$identity);

  /// Serializes this UpdateJobOfferInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateJobOfferInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.showButton, showButton) || other.showButton == showButton)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imageId,const DeepCollectionEquality().hash(imageIds),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations),genderId,actorId,showButton,limitDate,status);

@override
String toString() {
  return 'UpdateJobOfferInputModel(id: $id, title: $title, description: $description, imageId: $imageId, imageIds: $imageIds, categories: $categories, locations: $locations, genderId: $genderId, actorId: $actorId, showButton: $showButton, limitDate: $limitDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateJobOfferInputModelCopyWith<$Res>  {
  factory $UpdateJobOfferInputModelCopyWith(UpdateJobOfferInputModel value, $Res Function(UpdateJobOfferInputModel) _then) = _$UpdateJobOfferInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId, List<int>? imageIds,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationsIds', defaultValue: []) List<int> locations,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: false) bool showButton,@JsonKey(name: 'date_limit', defaultValue: '') String limitDate,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$UpdateJobOfferInputModelCopyWithImpl<$Res>
    implements $UpdateJobOfferInputModelCopyWith<$Res> {
  _$UpdateJobOfferInputModelCopyWithImpl(this._self, this._then);

  final UpdateJobOfferInputModel _self;
  final $Res Function(UpdateJobOfferInputModel) _then;

/// Create a copy of UpdateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imageId = freezed,Object? imageIds = freezed,Object? categories = null,Object? locations = null,Object? genderId = null,Object? actorId = null,Object? showButton = null,Object? limitDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,imageIds: freezed == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<int>,genderId: null == genderId ? _self.genderId : genderId // ignore: cast_nullable_to_non_nullable
as int,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,showButton: null == showButton ? _self.showButton : showButton // ignore: cast_nullable_to_non_nullable
as bool,limitDate: null == limitDate ? _self.limitDate : limitDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateJobOfferInputModel].
extension UpdateJobOfferInputModelPatterns on UpdateJobOfferInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateJobOfferInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateJobOfferInputModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateJobOfferInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locations,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel():
return $default(_that.id,_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locations,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId,  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: [])  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: [])  List<int> locations, @JsonKey(defaultValue: -1)  int genderId, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: false)  bool showButton, @JsonKey(name: 'date_limit', defaultValue: '')  String limitDate, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateJobOfferInputModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.imageId,_that.imageIds,_that.categories,_that.locations,_that.genderId,_that.actorId,_that.showButton,_that.limitDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateJobOfferInputModel extends UpdateJobOfferInputModel {
  const _UpdateJobOfferInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'image_id') this.imageId, final  List<int>? imageIds, @JsonKey(name: 'categoryIds', defaultValue: []) required final  List<int> categories, @JsonKey(name: 'locationsIds', defaultValue: []) required final  List<int> locations, @JsonKey(defaultValue: -1) required this.genderId, @JsonKey(defaultValue: -1) required this.actorId, @JsonKey(defaultValue: false) required this.showButton, @JsonKey(name: 'date_limit', defaultValue: '') required this.limitDate, @JsonKey(defaultValue: 'published') required this.status}): _imageIds = imageIds,_categories = categories,_locations = locations,super._();
  factory _UpdateJobOfferInputModel.fromJson(Map<String, dynamic> json) => _$UpdateJobOfferInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
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

 final  List<int> _locations;
@override@JsonKey(name: 'locationsIds', defaultValue: []) List<int> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

// @JsonKey(defaultValue: -1) required int locationId,
@override@JsonKey(defaultValue: -1) final  int genderId;
@override@JsonKey(defaultValue: -1) final  int actorId;
@override@JsonKey(defaultValue: false) final  bool showButton;
@override@JsonKey(name: 'date_limit', defaultValue: '') final  String limitDate;
@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of UpdateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateJobOfferInputModelCopyWith<_UpdateJobOfferInputModel> get copyWith => __$UpdateJobOfferInputModelCopyWithImpl<_UpdateJobOfferInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateJobOfferInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateJobOfferInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations)&&(identical(other.genderId, genderId) || other.genderId == genderId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.showButton, showButton) || other.showButton == showButton)&&(identical(other.limitDate, limitDate) || other.limitDate == limitDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,imageId,const DeepCollectionEquality().hash(_imageIds),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations),genderId,actorId,showButton,limitDate,status);

@override
String toString() {
  return 'UpdateJobOfferInputModel(id: $id, title: $title, description: $description, imageId: $imageId, imageIds: $imageIds, categories: $categories, locations: $locations, genderId: $genderId, actorId: $actorId, showButton: $showButton, limitDate: $limitDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateJobOfferInputModelCopyWith<$Res> implements $UpdateJobOfferInputModelCopyWith<$Res> {
  factory _$UpdateJobOfferInputModelCopyWith(_UpdateJobOfferInputModel value, $Res Function(_UpdateJobOfferInputModel) _then) = __$UpdateJobOfferInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId, List<int>? imageIds,@JsonKey(name: 'categoryIds', defaultValue: []) List<int> categories,@JsonKey(name: 'locationsIds', defaultValue: []) List<int> locations,@JsonKey(defaultValue: -1) int genderId,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: false) bool showButton,@JsonKey(name: 'date_limit', defaultValue: '') String limitDate,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$UpdateJobOfferInputModelCopyWithImpl<$Res>
    implements _$UpdateJobOfferInputModelCopyWith<$Res> {
  __$UpdateJobOfferInputModelCopyWithImpl(this._self, this._then);

  final _UpdateJobOfferInputModel _self;
  final $Res Function(_UpdateJobOfferInputModel) _then;

/// Create a copy of UpdateJobOfferInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? imageId = freezed,Object? imageIds = freezed,Object? categories = null,Object? locations = null,Object? genderId = null,Object? actorId = null,Object? showButton = null,Object? limitDate = null,Object? status = null,}) {
  return _then(_UpdateJobOfferInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,imageIds: freezed == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<int>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
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
