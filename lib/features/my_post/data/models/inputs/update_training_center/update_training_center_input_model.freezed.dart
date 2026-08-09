// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_training_center_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTrainingCenterInputModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get description;@JsonKey(defaultValue: -1) int get locationId;@JsonKey(defaultValue: -1) int get domainId;@JsonKey(name: 'image_ids') List<int>? get imageIds;// @JsonKey(defaultValue: -1) required int typeId,
// @JsonKey(defaultValue: -1) required int tagId,
// @JsonKey(defaultValue: -1) required int durationId,
@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of UpdateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTrainingCenterInputModelCopyWith<UpdateTrainingCenterInputModel> get copyWith => _$UpdateTrainingCenterInputModelCopyWithImpl<UpdateTrainingCenterInputModel>(this as UpdateTrainingCenterInputModel, _$identity);

  /// Serializes this UpdateTrainingCenterInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTrainingCenterInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.domainId, domainId) || other.domainId == domainId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,locationId,domainId,const DeepCollectionEquality().hash(imageIds),status);

@override
String toString() {
  return 'UpdateTrainingCenterInputModel(id: $id, name: $name, description: $description, locationId: $locationId, domainId: $domainId, imageIds: $imageIds, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateTrainingCenterInputModelCopyWith<$Res>  {
  factory $UpdateTrainingCenterInputModelCopyWith(UpdateTrainingCenterInputModel value, $Res Function(UpdateTrainingCenterInputModel) _then) = _$UpdateTrainingCenterInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(defaultValue: -1) int domainId,@JsonKey(name: 'image_ids') List<int>? imageIds,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$UpdateTrainingCenterInputModelCopyWithImpl<$Res>
    implements $UpdateTrainingCenterInputModelCopyWith<$Res> {
  _$UpdateTrainingCenterInputModelCopyWithImpl(this._self, this._then);

  final UpdateTrainingCenterInputModel _self;
  final $Res Function(UpdateTrainingCenterInputModel) _then;

/// Create a copy of UpdateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? locationId = null,Object? domainId = null,Object? imageIds = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,domainId: null == domainId ? _self.domainId : domainId // ignore: cast_nullable_to_non_nullable
as int,imageIds: freezed == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateTrainingCenterInputModel].
extension UpdateTrainingCenterInputModelPatterns on UpdateTrainingCenterInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateTrainingCenterInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateTrainingCenterInputModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateTrainingCenterInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int domainId, @JsonKey(name: 'image_ids')  List<int>? imageIds, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.domainId,_that.imageIds,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int domainId, @JsonKey(name: 'image_ids')  List<int>? imageIds, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel():
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.domainId,_that.imageIds,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(defaultValue: -1)  int domainId, @JsonKey(name: 'image_ids')  List<int>? imageIds, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.domainId,_that.imageIds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTrainingCenterInputModel extends UpdateTrainingCenterInputModel {
  const _UpdateTrainingCenterInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.description, @JsonKey(defaultValue: -1) required this.locationId, @JsonKey(defaultValue: -1) required this.domainId, @JsonKey(name: 'image_ids') final  List<int>? imageIds, @JsonKey(defaultValue: 'published') required this.status}): _imageIds = imageIds,super._();
  factory _UpdateTrainingCenterInputModel.fromJson(Map<String, dynamic> json) => _$UpdateTrainingCenterInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(defaultValue: -1) final  int locationId;
@override@JsonKey(defaultValue: -1) final  int domainId;
 final  List<int>? _imageIds;
@override@JsonKey(name: 'image_ids') List<int>? get imageIds {
  final value = _imageIds;
  if (value == null) return null;
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

// @JsonKey(defaultValue: -1) required int typeId,
// @JsonKey(defaultValue: -1) required int tagId,
// @JsonKey(defaultValue: -1) required int durationId,
@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of UpdateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateTrainingCenterInputModelCopyWith<_UpdateTrainingCenterInputModel> get copyWith => __$UpdateTrainingCenterInputModelCopyWithImpl<_UpdateTrainingCenterInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateTrainingCenterInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTrainingCenterInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&(identical(other.domainId, domainId) || other.domainId == domainId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,locationId,domainId,const DeepCollectionEquality().hash(_imageIds),status);

@override
String toString() {
  return 'UpdateTrainingCenterInputModel(id: $id, name: $name, description: $description, locationId: $locationId, domainId: $domainId, imageIds: $imageIds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateTrainingCenterInputModelCopyWith<$Res> implements $UpdateTrainingCenterInputModelCopyWith<$Res> {
  factory _$UpdateTrainingCenterInputModelCopyWith(_UpdateTrainingCenterInputModel value, $Res Function(_UpdateTrainingCenterInputModel) _then) = __$UpdateTrainingCenterInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(defaultValue: -1) int domainId,@JsonKey(name: 'image_ids') List<int>? imageIds,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$UpdateTrainingCenterInputModelCopyWithImpl<$Res>
    implements _$UpdateTrainingCenterInputModelCopyWith<$Res> {
  __$UpdateTrainingCenterInputModelCopyWithImpl(this._self, this._then);

  final _UpdateTrainingCenterInputModel _self;
  final $Res Function(_UpdateTrainingCenterInputModel) _then;

/// Create a copy of UpdateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? locationId = null,Object? domainId = null,Object? imageIds = freezed,Object? status = null,}) {
  return _then(_UpdateTrainingCenterInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,domainId: null == domainId ? _self.domainId : domainId // ignore: cast_nullable_to_non_nullable
as int,imageIds: freezed == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
