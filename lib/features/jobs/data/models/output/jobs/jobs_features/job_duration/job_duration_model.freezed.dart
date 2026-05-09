// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_duration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobDurationModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'nom', defaultValue: '') String get duration;
/// Create a copy of JobDurationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDurationModelCopyWith<JobDurationModel> get copyWith => _$JobDurationModelCopyWithImpl<JobDurationModel>(this as JobDurationModel, _$identity);

  /// Serializes this JobDurationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDurationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,duration);

@override
String toString() {
  return 'JobDurationModel(id: $id, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $JobDurationModelCopyWith<$Res>  {
  factory $JobDurationModelCopyWith(JobDurationModel value, $Res Function(JobDurationModel) _then) = _$JobDurationModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String duration
});




}
/// @nodoc
class _$JobDurationModelCopyWithImpl<$Res>
    implements $JobDurationModelCopyWith<$Res> {
  _$JobDurationModelCopyWithImpl(this._self, this._then);

  final JobDurationModel _self;
  final $Res Function(JobDurationModel) _then;

/// Create a copy of JobDurationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobDurationModel].
extension JobDurationModelPatterns on JobDurationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDurationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDurationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDurationModel value)  $default,){
final _that = this;
switch (_that) {
case _JobDurationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDurationModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobDurationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDurationModel() when $default != null:
return $default(_that.id,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String duration)  $default,) {final _that = this;
switch (_that) {
case _JobDurationModel():
return $default(_that.id,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String duration)?  $default,) {final _that = this;
switch (_that) {
case _JobDurationModel() when $default != null:
return $default(_that.id,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobDurationModel extends JobDurationModel {
  const _JobDurationModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'nom', defaultValue: '') required this.duration}): super._();
  factory _JobDurationModel.fromJson(Map<String, dynamic> json) => _$JobDurationModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'nom', defaultValue: '') final  String duration;

/// Create a copy of JobDurationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDurationModelCopyWith<_JobDurationModel> get copyWith => __$JobDurationModelCopyWithImpl<_JobDurationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobDurationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDurationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,duration);

@override
String toString() {
  return 'JobDurationModel(id: $id, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$JobDurationModelCopyWith<$Res> implements $JobDurationModelCopyWith<$Res> {
  factory _$JobDurationModelCopyWith(_JobDurationModel value, $Res Function(_JobDurationModel) _then) = __$JobDurationModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String duration
});




}
/// @nodoc
class __$JobDurationModelCopyWithImpl<$Res>
    implements _$JobDurationModelCopyWith<$Res> {
  __$JobDurationModelCopyWithImpl(this._self, this._then);

  final _JobDurationModel _self;
  final $Res Function(_JobDurationModel) _then;

/// Create a copy of JobDurationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? duration = null,}) {
  return _then(_JobDurationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
