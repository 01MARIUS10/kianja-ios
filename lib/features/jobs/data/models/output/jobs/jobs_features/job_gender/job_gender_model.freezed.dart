// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_gender_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobGenderModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'nom', defaultValue: '') String get name;
/// Create a copy of JobGenderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobGenderModelCopyWith<JobGenderModel> get copyWith => _$JobGenderModelCopyWithImpl<JobGenderModel>(this as JobGenderModel, _$identity);

  /// Serializes this JobGenderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobGenderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobGenderModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $JobGenderModelCopyWith<$Res>  {
  factory $JobGenderModelCopyWith(JobGenderModel value, $Res Function(JobGenderModel) _then) = _$JobGenderModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class _$JobGenderModelCopyWithImpl<$Res>
    implements $JobGenderModelCopyWith<$Res> {
  _$JobGenderModelCopyWithImpl(this._self, this._then);

  final JobGenderModel _self;
  final $Res Function(JobGenderModel) _then;

/// Create a copy of JobGenderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobGenderModel].
extension JobGenderModelPatterns on JobGenderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobGenderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobGenderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobGenderModel value)  $default,){
final _that = this;
switch (_that) {
case _JobGenderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobGenderModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobGenderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobGenderModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name)  $default,) {final _that = this;
switch (_that) {
case _JobGenderModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name)?  $default,) {final _that = this;
switch (_that) {
case _JobGenderModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobGenderModel extends JobGenderModel {
  const _JobGenderModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'nom', defaultValue: '') required this.name}): super._();
  factory _JobGenderModel.fromJson(Map<String, dynamic> json) => _$JobGenderModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'nom', defaultValue: '') final  String name;

/// Create a copy of JobGenderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobGenderModelCopyWith<_JobGenderModel> get copyWith => __$JobGenderModelCopyWithImpl<_JobGenderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobGenderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobGenderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobGenderModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobGenderModelCopyWith<$Res> implements $JobGenderModelCopyWith<$Res> {
  factory _$JobGenderModelCopyWith(_JobGenderModel value, $Res Function(_JobGenderModel) _then) = __$JobGenderModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class __$JobGenderModelCopyWithImpl<$Res>
    implements _$JobGenderModelCopyWith<$Res> {
  __$JobGenderModelCopyWithImpl(this._self, this._then);

  final _JobGenderModel _self;
  final $Res Function(_JobGenderModel) _then;

/// Create a copy of JobGenderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_JobGenderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
