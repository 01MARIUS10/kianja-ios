// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobTypeModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'nom', defaultValue: '') String get name;
/// Create a copy of JobTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobTypeModelCopyWith<JobTypeModel> get copyWith => _$JobTypeModelCopyWithImpl<JobTypeModel>(this as JobTypeModel, _$identity);

  /// Serializes this JobTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobTypeModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $JobTypeModelCopyWith<$Res>  {
  factory $JobTypeModelCopyWith(JobTypeModel value, $Res Function(JobTypeModel) _then) = _$JobTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class _$JobTypeModelCopyWithImpl<$Res>
    implements $JobTypeModelCopyWith<$Res> {
  _$JobTypeModelCopyWithImpl(this._self, this._then);

  final JobTypeModel _self;
  final $Res Function(JobTypeModel) _then;

/// Create a copy of JobTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobTypeModel].
extension JobTypeModelPatterns on JobTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _JobTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobTypeModel() when $default != null:
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
case _JobTypeModel() when $default != null:
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
case _JobTypeModel():
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
case _JobTypeModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobTypeModel extends JobTypeModel {
  const _JobTypeModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'nom', defaultValue: '') required this.name}): super._();
  factory _JobTypeModel.fromJson(Map<String, dynamic> json) => _$JobTypeModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'nom', defaultValue: '') final  String name;

/// Create a copy of JobTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobTypeModelCopyWith<_JobTypeModel> get copyWith => __$JobTypeModelCopyWithImpl<_JobTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobTypeModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobTypeModelCopyWith<$Res> implements $JobTypeModelCopyWith<$Res> {
  factory _$JobTypeModelCopyWith(_JobTypeModel value, $Res Function(_JobTypeModel) _then) = __$JobTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class __$JobTypeModelCopyWithImpl<$Res>
    implements _$JobTypeModelCopyWith<$Res> {
  __$JobTypeModelCopyWithImpl(this._self, this._then);

  final _JobTypeModel _self;
  final $Res Function(_JobTypeModel) _then;

/// Create a copy of JobTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_JobTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
