// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_name_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingNameModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;
/// Create a copy of TrainingNameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingNameModelCopyWith<TrainingNameModel> get copyWith => _$TrainingNameModelCopyWithImpl<TrainingNameModel>(this as TrainingNameModel, _$identity);

  /// Serializes this TrainingNameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingNameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TrainingNameModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $TrainingNameModelCopyWith<$Res>  {
  factory $TrainingNameModelCopyWith(TrainingNameModel value, $Res Function(TrainingNameModel) _then) = _$TrainingNameModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name
});




}
/// @nodoc
class _$TrainingNameModelCopyWithImpl<$Res>
    implements $TrainingNameModelCopyWith<$Res> {
  _$TrainingNameModelCopyWithImpl(this._self, this._then);

  final TrainingNameModel _self;
  final $Res Function(TrainingNameModel) _then;

/// Create a copy of TrainingNameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingNameModel].
extension TrainingNameModelPatterns on TrainingNameModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingNameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingNameModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingNameModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingNameModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingNameModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingNameModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingNameModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name)  $default,) {final _that = this;
switch (_that) {
case _TrainingNameModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name)?  $default,) {final _that = this;
switch (_that) {
case _TrainingNameModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingNameModel extends TrainingNameModel {
  const _TrainingNameModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name}): super._();
  factory _TrainingNameModel.fromJson(Map<String, dynamic> json) => _$TrainingNameModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;

/// Create a copy of TrainingNameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingNameModelCopyWith<_TrainingNameModel> get copyWith => __$TrainingNameModelCopyWithImpl<_TrainingNameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingNameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingNameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'TrainingNameModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TrainingNameModelCopyWith<$Res> implements $TrainingNameModelCopyWith<$Res> {
  factory _$TrainingNameModelCopyWith(_TrainingNameModel value, $Res Function(_TrainingNameModel) _then) = __$TrainingNameModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name
});




}
/// @nodoc
class __$TrainingNameModelCopyWithImpl<$Res>
    implements _$TrainingNameModelCopyWith<$Res> {
  __$TrainingNameModelCopyWithImpl(this._self, this._then);

  final _TrainingNameModel _self;
  final $Res Function(_TrainingNameModel) _then;

/// Create a copy of TrainingNameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_TrainingNameModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
