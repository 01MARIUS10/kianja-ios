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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get description;@JsonKey(defaultValue: -1) int get locationId;@JsonKey(name: 'image_ids', defaultValue: []) List<int> get imageIds;@JsonKey(defaultValue: -1) int get actorId;@JsonKey(defaultValue: -1) int get typeId;@JsonKey(defaultValue: -1) int get tagId;@JsonKey(defaultValue: -1) int get durationId;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of UpdateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateTrainingCenterInputModelCopyWith<UpdateTrainingCenterInputModel> get copyWith => _$UpdateTrainingCenterInputModelCopyWithImpl<UpdateTrainingCenterInputModel>(this as UpdateTrainingCenterInputModel, _$identity);

  /// Serializes this UpdateTrainingCenterInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateTrainingCenterInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,locationId,const DeepCollectionEquality().hash(imageIds),actorId,typeId,tagId,durationId,status);

@override
String toString() {
  return 'UpdateTrainingCenterInputModel(id: $id, name: $name, description: $description, locationId: $locationId, imageIds: $imageIds, actorId: $actorId, typeId: $typeId, tagId: $tagId, durationId: $durationId, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateTrainingCenterInputModelCopyWith<$Res>  {
  factory $UpdateTrainingCenterInputModelCopyWith(UpdateTrainingCenterInputModel value, $Res Function(UpdateTrainingCenterInputModel) _then) = _$UpdateTrainingCenterInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(name: 'image_ids', defaultValue: []) List<int> imageIds,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int tagId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: 'published') String status
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? locationId = null,Object? imageIds = null,Object? actorId = null,Object? typeId = null,Object? tagId = null,Object? durationId = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,imageIds: null == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.imageIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel():
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.imageIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateTrainingCenterInputModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.locationId,_that.imageIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateTrainingCenterInputModel extends UpdateTrainingCenterInputModel {
  const _UpdateTrainingCenterInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.description, @JsonKey(defaultValue: -1) required this.locationId, @JsonKey(name: 'image_ids', defaultValue: []) required final  List<int> imageIds, @JsonKey(defaultValue: -1) required this.actorId, @JsonKey(defaultValue: -1) required this.typeId, @JsonKey(defaultValue: -1) required this.tagId, @JsonKey(defaultValue: -1) required this.durationId, @JsonKey(defaultValue: 'published') required this.status}): _imageIds = imageIds,super._();
  factory _UpdateTrainingCenterInputModel.fromJson(Map<String, dynamic> json) => _$UpdateTrainingCenterInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(defaultValue: -1) final  int locationId;
 final  List<int> _imageIds;
@override@JsonKey(name: 'image_ids', defaultValue: []) List<int> get imageIds {
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageIds);
}

@override@JsonKey(defaultValue: -1) final  int actorId;
@override@JsonKey(defaultValue: -1) final  int typeId;
@override@JsonKey(defaultValue: -1) final  int tagId;
@override@JsonKey(defaultValue: -1) final  int durationId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateTrainingCenterInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,locationId,const DeepCollectionEquality().hash(_imageIds),actorId,typeId,tagId,durationId,status);

@override
String toString() {
  return 'UpdateTrainingCenterInputModel(id: $id, name: $name, description: $description, locationId: $locationId, imageIds: $imageIds, actorId: $actorId, typeId: $typeId, tagId: $tagId, durationId: $durationId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateTrainingCenterInputModelCopyWith<$Res> implements $UpdateTrainingCenterInputModelCopyWith<$Res> {
  factory _$UpdateTrainingCenterInputModelCopyWith(_UpdateTrainingCenterInputModel value, $Res Function(_UpdateTrainingCenterInputModel) _then) = __$UpdateTrainingCenterInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(name: 'image_ids', defaultValue: []) List<int> imageIds,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int tagId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: 'published') String status
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? locationId = null,Object? imageIds = null,Object? actorId = null,Object? typeId = null,Object? tagId = null,Object? durationId = null,Object? status = null,}) {
  return _then(_UpdateTrainingCenterInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,imageIds: null == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
