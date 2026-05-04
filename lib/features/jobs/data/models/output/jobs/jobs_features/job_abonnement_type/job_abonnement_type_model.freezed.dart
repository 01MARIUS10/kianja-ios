// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_abonnement_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobAbonnementTypeModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'nom', defaultValue: '') String get name;
/// Create a copy of JobAbonnementTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobAbonnementTypeModelCopyWith<JobAbonnementTypeModel> get copyWith => _$JobAbonnementTypeModelCopyWithImpl<JobAbonnementTypeModel>(this as JobAbonnementTypeModel, _$identity);

  /// Serializes this JobAbonnementTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobAbonnementTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobAbonnementTypeModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $JobAbonnementTypeModelCopyWith<$Res>  {
  factory $JobAbonnementTypeModelCopyWith(JobAbonnementTypeModel value, $Res Function(JobAbonnementTypeModel) _then) = _$JobAbonnementTypeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class _$JobAbonnementTypeModelCopyWithImpl<$Res>
    implements $JobAbonnementTypeModelCopyWith<$Res> {
  _$JobAbonnementTypeModelCopyWithImpl(this._self, this._then);

  final JobAbonnementTypeModel _self;
  final $Res Function(JobAbonnementTypeModel) _then;

/// Create a copy of JobAbonnementTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobAbonnementTypeModel].
extension JobAbonnementTypeModelPatterns on JobAbonnementTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobAbonnementTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobAbonnementTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobAbonnementTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _JobAbonnementTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobAbonnementTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobAbonnementTypeModel() when $default != null:
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
case _JobAbonnementTypeModel() when $default != null:
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
case _JobAbonnementTypeModel():
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
case _JobAbonnementTypeModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobAbonnementTypeModel extends JobAbonnementTypeModel {
  const _JobAbonnementTypeModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'nom', defaultValue: '') required this.name}): super._();
  factory _JobAbonnementTypeModel.fromJson(Map<String, dynamic> json) => _$JobAbonnementTypeModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'nom', defaultValue: '') final  String name;

/// Create a copy of JobAbonnementTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobAbonnementTypeModelCopyWith<_JobAbonnementTypeModel> get copyWith => __$JobAbonnementTypeModelCopyWithImpl<_JobAbonnementTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobAbonnementTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobAbonnementTypeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'JobAbonnementTypeModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobAbonnementTypeModelCopyWith<$Res> implements $JobAbonnementTypeModelCopyWith<$Res> {
  factory _$JobAbonnementTypeModelCopyWith(_JobAbonnementTypeModel value, $Res Function(_JobAbonnementTypeModel) _then) = __$JobAbonnementTypeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name
});




}
/// @nodoc
class __$JobAbonnementTypeModelCopyWithImpl<$Res>
    implements _$JobAbonnementTypeModelCopyWith<$Res> {
  __$JobAbonnementTypeModelCopyWithImpl(this._self, this._then);

  final _JobAbonnementTypeModel _self;
  final $Res Function(_JobAbonnementTypeModel) _then;

/// Create a copy of JobAbonnementTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_JobAbonnementTypeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
