// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hot_event_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotEventInputModel {

@JsonKey(name: 'training_center_id', defaultValue: -1) int get trainingCenterId;@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get type;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'image_id') int? get imageId;@JsonKey(name: 'start_date', defaultValue: '') String get startDate;@JsonKey(name: 'end_date', defaultValue: '') String get endDate;
/// Create a copy of HotEventInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotEventInputModelCopyWith<HotEventInputModel> get copyWith => _$HotEventInputModelCopyWithImpl<HotEventInputModel>(this as HotEventInputModel, _$identity);

  /// Serializes this HotEventInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotEventInputModel&&(identical(other.trainingCenterId, trainingCenterId) || other.trainingCenterId == trainingCenterId)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingCenterId,id,type,title,description,imageId,startDate,endDate);

@override
String toString() {
  return 'HotEventInputModel(trainingCenterId: $trainingCenterId, id: $id, type: $type, title: $title, description: $description, imageId: $imageId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $HotEventInputModelCopyWith<$Res>  {
  factory $HotEventInputModelCopyWith(HotEventInputModel value, $Res Function(HotEventInputModel) _then) = _$HotEventInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'training_center_id', defaultValue: -1) int trainingCenterId,@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId,@JsonKey(name: 'start_date', defaultValue: '') String startDate,@JsonKey(name: 'end_date', defaultValue: '') String endDate
});




}
/// @nodoc
class _$HotEventInputModelCopyWithImpl<$Res>
    implements $HotEventInputModelCopyWith<$Res> {
  _$HotEventInputModelCopyWithImpl(this._self, this._then);

  final HotEventInputModel _self;
  final $Res Function(HotEventInputModel) _then;

/// Create a copy of HotEventInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainingCenterId = null,Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? imageId = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
trainingCenterId: null == trainingCenterId ? _self.trainingCenterId : trainingCenterId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HotEventInputModel].
extension HotEventInputModelPatterns on HotEventInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotEventInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotEventInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotEventInputModel value)  $default,){
final _that = this;
switch (_that) {
case _HotEventInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotEventInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _HotEventInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'training_center_id', defaultValue: -1)  int trainingCenterId, @JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotEventInputModel() when $default != null:
return $default(_that.trainingCenterId,_that.id,_that.type,_that.title,_that.description,_that.imageId,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'training_center_id', defaultValue: -1)  int trainingCenterId, @JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate)  $default,) {final _that = this;
switch (_that) {
case _HotEventInputModel():
return $default(_that.trainingCenterId,_that.id,_that.type,_that.title,_that.description,_that.imageId,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'training_center_id', defaultValue: -1)  int trainingCenterId, @JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'image_id')  int? imageId, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _HotEventInputModel() when $default != null:
return $default(_that.trainingCenterId,_that.id,_that.type,_that.title,_that.description,_that.imageId,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotEventInputModel extends HotEventInputModel {
  const _HotEventInputModel({@JsonKey(name: 'training_center_id', defaultValue: -1) required this.trainingCenterId, @JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.type, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'image_id') this.imageId, @JsonKey(name: 'start_date', defaultValue: '') required this.startDate, @JsonKey(name: 'end_date', defaultValue: '') required this.endDate}): super._();
  factory _HotEventInputModel.fromJson(Map<String, dynamic> json) => _$HotEventInputModelFromJson(json);

@override@JsonKey(name: 'training_center_id', defaultValue: -1) final  int trainingCenterId;
@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String type;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(name: 'image_id') final  int? imageId;
@override@JsonKey(name: 'start_date', defaultValue: '') final  String startDate;
@override@JsonKey(name: 'end_date', defaultValue: '') final  String endDate;

/// Create a copy of HotEventInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotEventInputModelCopyWith<_HotEventInputModel> get copyWith => __$HotEventInputModelCopyWithImpl<_HotEventInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotEventInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotEventInputModel&&(identical(other.trainingCenterId, trainingCenterId) || other.trainingCenterId == trainingCenterId)&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainingCenterId,id,type,title,description,imageId,startDate,endDate);

@override
String toString() {
  return 'HotEventInputModel(trainingCenterId: $trainingCenterId, id: $id, type: $type, title: $title, description: $description, imageId: $imageId, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$HotEventInputModelCopyWith<$Res> implements $HotEventInputModelCopyWith<$Res> {
  factory _$HotEventInputModelCopyWith(_HotEventInputModel value, $Res Function(_HotEventInputModel) _then) = __$HotEventInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'training_center_id', defaultValue: -1) int trainingCenterId,@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'image_id') int? imageId,@JsonKey(name: 'start_date', defaultValue: '') String startDate,@JsonKey(name: 'end_date', defaultValue: '') String endDate
});




}
/// @nodoc
class __$HotEventInputModelCopyWithImpl<$Res>
    implements _$HotEventInputModelCopyWith<$Res> {
  __$HotEventInputModelCopyWithImpl(this._self, this._then);

  final _HotEventInputModel _self;
  final $Res Function(_HotEventInputModel) _then;

/// Create a copy of HotEventInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainingCenterId = null,Object? id = null,Object? type = null,Object? title = null,Object? description = null,Object? imageId = freezed,Object? startDate = null,Object? endDate = null,}) {
  return _then(_HotEventInputModel(
trainingCenterId: null == trainingCenterId ? _self.trainingCenterId : trainingCenterId // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as int?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
