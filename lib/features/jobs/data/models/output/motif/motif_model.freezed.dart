// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motif_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MotifModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'libelle', defaultValue: '') String get libelle;
/// Create a copy of MotifModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MotifModelCopyWith<MotifModel> get copyWith => _$MotifModelCopyWithImpl<MotifModel>(this as MotifModel, _$identity);

  /// Serializes this MotifModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MotifModel&&(identical(other.id, id) || other.id == id)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libelle);

@override
String toString() {
  return 'MotifModel(id: $id, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class $MotifModelCopyWith<$Res>  {
  factory $MotifModelCopyWith(MotifModel value, $Res Function(MotifModel) _then) = _$MotifModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'libelle', defaultValue: '') String libelle
});




}
/// @nodoc
class _$MotifModelCopyWithImpl<$Res>
    implements $MotifModelCopyWith<$Res> {
  _$MotifModelCopyWithImpl(this._self, this._then);

  final MotifModel _self;
  final $Res Function(MotifModel) _then;

/// Create a copy of MotifModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? libelle = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MotifModel].
extension MotifModelPatterns on MotifModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MotifModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MotifModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MotifModel value)  $default,){
final _that = this;
switch (_that) {
case _MotifModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MotifModel value)?  $default,){
final _that = this;
switch (_that) {
case _MotifModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'libelle', defaultValue: '')  String libelle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MotifModel() when $default != null:
return $default(_that.id,_that.libelle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'libelle', defaultValue: '')  String libelle)  $default,) {final _that = this;
switch (_that) {
case _MotifModel():
return $default(_that.id,_that.libelle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'libelle', defaultValue: '')  String libelle)?  $default,) {final _that = this;
switch (_that) {
case _MotifModel() when $default != null:
return $default(_that.id,_that.libelle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MotifModel extends MotifModel {
  const _MotifModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'libelle', defaultValue: '') required this.libelle}): super._();
  factory _MotifModel.fromJson(Map<String, dynamic> json) => _$MotifModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'libelle', defaultValue: '') final  String libelle;

/// Create a copy of MotifModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MotifModelCopyWith<_MotifModel> get copyWith => __$MotifModelCopyWithImpl<_MotifModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MotifModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MotifModel&&(identical(other.id, id) || other.id == id)&&(identical(other.libelle, libelle) || other.libelle == libelle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,libelle);

@override
String toString() {
  return 'MotifModel(id: $id, libelle: $libelle)';
}


}

/// @nodoc
abstract mixin class _$MotifModelCopyWith<$Res> implements $MotifModelCopyWith<$Res> {
  factory _$MotifModelCopyWith(_MotifModel value, $Res Function(_MotifModel) _then) = __$MotifModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'libelle', defaultValue: '') String libelle
});




}
/// @nodoc
class __$MotifModelCopyWithImpl<$Res>
    implements _$MotifModelCopyWith<$Res> {
  __$MotifModelCopyWithImpl(this._self, this._then);

  final _MotifModel _self;
  final $Res Function(_MotifModel) _then;

/// Create a copy of MotifModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? libelle = null,}) {
  return _then(_MotifModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,libelle: null == libelle ? _self.libelle : libelle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
