// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_training_center_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTrainingCenterInputModel {

@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get description;@JsonKey(defaultValue: -1) int get locationId;@JsonKey(name: 'image_ids', defaultValue: []) List<int> get imageIds;@JsonKey(defaultValue: []) List<int> get domainIds;@JsonKey(defaultValue: -1) int get actorId;@JsonKey(defaultValue: -1) int get typeId;@JsonKey(defaultValue: -1) int get tagId;@JsonKey(defaultValue: -1) int get durationId;@JsonKey(defaultValue: 'published') String get status;
/// Create a copy of CreateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTrainingCenterInputModelCopyWith<CreateTrainingCenterInputModel> get copyWith => _$CreateTrainingCenterInputModelCopyWithImpl<CreateTrainingCenterInputModel>(this as CreateTrainingCenterInputModel, _$identity);

  /// Serializes this CreateTrainingCenterInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTrainingCenterInputModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other.imageIds, imageIds)&&const DeepCollectionEquality().equals(other.domainIds, domainIds)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,locationId,const DeepCollectionEquality().hash(imageIds),const DeepCollectionEquality().hash(domainIds),actorId,typeId,tagId,durationId,status);

@override
String toString() {
  return 'CreateTrainingCenterInputModel(name: $name, description: $description, locationId: $locationId, imageIds: $imageIds, domainIds: $domainIds, actorId: $actorId, typeId: $typeId, tagId: $tagId, durationId: $durationId, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreateTrainingCenterInputModelCopyWith<$Res>  {
  factory $CreateTrainingCenterInputModelCopyWith(CreateTrainingCenterInputModel value, $Res Function(CreateTrainingCenterInputModel) _then) = _$CreateTrainingCenterInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(name: 'image_ids', defaultValue: []) List<int> imageIds,@JsonKey(defaultValue: []) List<int> domainIds,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int tagId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class _$CreateTrainingCenterInputModelCopyWithImpl<$Res>
    implements $CreateTrainingCenterInputModelCopyWith<$Res> {
  _$CreateTrainingCenterInputModelCopyWithImpl(this._self, this._then);

  final CreateTrainingCenterInputModel _self;
  final $Res Function(CreateTrainingCenterInputModel) _then;

/// Create a copy of CreateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? locationId = null,Object? imageIds = null,Object? domainIds = null,Object? actorId = null,Object? typeId = null,Object? tagId = null,Object? durationId = null,Object? status = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,imageIds: null == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>,domainIds: null == domainIds ? _self.domainIds : domainIds // ignore: cast_nullable_to_non_nullable
as List<int>,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTrainingCenterInputModel].
extension CreateTrainingCenterInputModelPatterns on CreateTrainingCenterInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTrainingCenterInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTrainingCenterInputModel value)  $default,){
final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTrainingCenterInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: [])  List<int> domainIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel() when $default != null:
return $default(_that.name,_that.description,_that.locationId,_that.imageIds,_that.domainIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: [])  List<int> domainIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)  $default,) {final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel():
return $default(_that.name,_that.description,_that.locationId,_that.imageIds,_that.domainIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String description, @JsonKey(defaultValue: -1)  int locationId, @JsonKey(name: 'image_ids', defaultValue: [])  List<int> imageIds, @JsonKey(defaultValue: [])  List<int> domainIds, @JsonKey(defaultValue: -1)  int actorId, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int tagId, @JsonKey(defaultValue: -1)  int durationId, @JsonKey(defaultValue: 'published')  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreateTrainingCenterInputModel() when $default != null:
return $default(_that.name,_that.description,_that.locationId,_that.imageIds,_that.domainIds,_that.actorId,_that.typeId,_that.tagId,_that.durationId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTrainingCenterInputModel extends CreateTrainingCenterInputModel {
  const _CreateTrainingCenterInputModel({@JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.description, @JsonKey(defaultValue: -1) required this.locationId, @JsonKey(name: 'image_ids', defaultValue: []) required final  List<int> imageIds, @JsonKey(defaultValue: []) required final  List<int> domainIds, @JsonKey(defaultValue: -1) required this.actorId, @JsonKey(defaultValue: -1) required this.typeId, @JsonKey(defaultValue: -1) required this.tagId, @JsonKey(defaultValue: -1) required this.durationId, @JsonKey(defaultValue: 'published') required this.status}): _imageIds = imageIds,_domainIds = domainIds,super._();
  factory _CreateTrainingCenterInputModel.fromJson(Map<String, dynamic> json) => _$CreateTrainingCenterInputModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(defaultValue: -1) final  int locationId;
 final  List<int> _imageIds;
@override@JsonKey(name: 'image_ids', defaultValue: []) List<int> get imageIds {
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imageIds);
}

 final  List<int> _domainIds;
@override@JsonKey(defaultValue: []) List<int> get domainIds {
  if (_domainIds is EqualUnmodifiableListView) return _domainIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domainIds);
}

@override@JsonKey(defaultValue: -1) final  int actorId;
@override@JsonKey(defaultValue: -1) final  int typeId;
@override@JsonKey(defaultValue: -1) final  int tagId;
@override@JsonKey(defaultValue: -1) final  int durationId;
@override@JsonKey(defaultValue: 'published') final  String status;

/// Create a copy of CreateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTrainingCenterInputModelCopyWith<_CreateTrainingCenterInputModel> get copyWith => __$CreateTrainingCenterInputModelCopyWithImpl<_CreateTrainingCenterInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTrainingCenterInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTrainingCenterInputModel&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.locationId, locationId) || other.locationId == locationId)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds)&&const DeepCollectionEquality().equals(other._domainIds, _domainIds)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.durationId, durationId) || other.durationId == durationId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,locationId,const DeepCollectionEquality().hash(_imageIds),const DeepCollectionEquality().hash(_domainIds),actorId,typeId,tagId,durationId,status);

@override
String toString() {
  return 'CreateTrainingCenterInputModel(name: $name, description: $description, locationId: $locationId, imageIds: $imageIds, domainIds: $domainIds, actorId: $actorId, typeId: $typeId, tagId: $tagId, durationId: $durationId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreateTrainingCenterInputModelCopyWith<$Res> implements $CreateTrainingCenterInputModelCopyWith<$Res> {
  factory _$CreateTrainingCenterInputModelCopyWith(_CreateTrainingCenterInputModel value, $Res Function(_CreateTrainingCenterInputModel) _then) = __$CreateTrainingCenterInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String description,@JsonKey(defaultValue: -1) int locationId,@JsonKey(name: 'image_ids', defaultValue: []) List<int> imageIds,@JsonKey(defaultValue: []) List<int> domainIds,@JsonKey(defaultValue: -1) int actorId,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int tagId,@JsonKey(defaultValue: -1) int durationId,@JsonKey(defaultValue: 'published') String status
});




}
/// @nodoc
class __$CreateTrainingCenterInputModelCopyWithImpl<$Res>
    implements _$CreateTrainingCenterInputModelCopyWith<$Res> {
  __$CreateTrainingCenterInputModelCopyWithImpl(this._self, this._then);

  final _CreateTrainingCenterInputModel _self;
  final $Res Function(_CreateTrainingCenterInputModel) _then;

/// Create a copy of CreateTrainingCenterInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? locationId = null,Object? imageIds = null,Object? domainIds = null,Object? actorId = null,Object? typeId = null,Object? tagId = null,Object? durationId = null,Object? status = null,}) {
  return _then(_CreateTrainingCenterInputModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,locationId: null == locationId ? _self.locationId : locationId // ignore: cast_nullable_to_non_nullable
as int,imageIds: null == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>,domainIds: null == domainIds ? _self._domainIds : domainIds // ignore: cast_nullable_to_non_nullable
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
