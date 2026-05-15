// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_center_view_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingCenterViewCategoryModel {

@JsonKey(name: 'Vip', defaultValue: []) List<TrainingCenterModel> get vip;@JsonKey(name: 'Premium', defaultValue: []) List<TrainingCenterModel> get premium;@JsonKey(name: 'Normal', defaultValue: []) List<TrainingCenterModel> get normal;
/// Create a copy of TrainingCenterViewCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCenterViewCategoryModelCopyWith<TrainingCenterViewCategoryModel> get copyWith => _$TrainingCenterViewCategoryModelCopyWithImpl<TrainingCenterViewCategoryModel>(this as TrainingCenterViewCategoryModel, _$identity);

  /// Serializes this TrainingCenterViewCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingCenterViewCategoryModel&&const DeepCollectionEquality().equals(other.vip, vip)&&const DeepCollectionEquality().equals(other.premium, premium)&&const DeepCollectionEquality().equals(other.normal, normal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(vip),const DeepCollectionEquality().hash(premium),const DeepCollectionEquality().hash(normal));

@override
String toString() {
  return 'TrainingCenterViewCategoryModel(vip: $vip, premium: $premium, normal: $normal)';
}


}

/// @nodoc
abstract mixin class $TrainingCenterViewCategoryModelCopyWith<$Res>  {
  factory $TrainingCenterViewCategoryModelCopyWith(TrainingCenterViewCategoryModel value, $Res Function(TrainingCenterViewCategoryModel) _then) = _$TrainingCenterViewCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Vip', defaultValue: []) List<TrainingCenterModel> vip,@JsonKey(name: 'Premium', defaultValue: []) List<TrainingCenterModel> premium,@JsonKey(name: 'Normal', defaultValue: []) List<TrainingCenterModel> normal
});




}
/// @nodoc
class _$TrainingCenterViewCategoryModelCopyWithImpl<$Res>
    implements $TrainingCenterViewCategoryModelCopyWith<$Res> {
  _$TrainingCenterViewCategoryModelCopyWithImpl(this._self, this._then);

  final TrainingCenterViewCategoryModel _self;
  final $Res Function(TrainingCenterViewCategoryModel) _then;

/// Create a copy of TrainingCenterViewCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vip = null,Object? premium = null,Object? normal = null,}) {
  return _then(_self.copyWith(
vip: null == vip ? _self.vip : vip // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,premium: null == premium ? _self.premium : premium // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,normal: null == normal ? _self.normal : normal // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingCenterViewCategoryModel].
extension TrainingCenterViewCategoryModelPatterns on TrainingCenterViewCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingCenterViewCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingCenterViewCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingCenterViewCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Vip', defaultValue: [])  List<TrainingCenterModel> vip, @JsonKey(name: 'Premium', defaultValue: [])  List<TrainingCenterModel> premium, @JsonKey(name: 'Normal', defaultValue: [])  List<TrainingCenterModel> normal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel() when $default != null:
return $default(_that.vip,_that.premium,_that.normal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Vip', defaultValue: [])  List<TrainingCenterModel> vip, @JsonKey(name: 'Premium', defaultValue: [])  List<TrainingCenterModel> premium, @JsonKey(name: 'Normal', defaultValue: [])  List<TrainingCenterModel> normal)  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel():
return $default(_that.vip,_that.premium,_that.normal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Vip', defaultValue: [])  List<TrainingCenterModel> vip, @JsonKey(name: 'Premium', defaultValue: [])  List<TrainingCenterModel> premium, @JsonKey(name: 'Normal', defaultValue: [])  List<TrainingCenterModel> normal)?  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterViewCategoryModel() when $default != null:
return $default(_that.vip,_that.premium,_that.normal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingCenterViewCategoryModel extends TrainingCenterViewCategoryModel {
  const _TrainingCenterViewCategoryModel({@JsonKey(name: 'Vip', defaultValue: []) required final  List<TrainingCenterModel> vip, @JsonKey(name: 'Premium', defaultValue: []) required final  List<TrainingCenterModel> premium, @JsonKey(name: 'Normal', defaultValue: []) required final  List<TrainingCenterModel> normal}): _vip = vip,_premium = premium,_normal = normal,super._();
  factory _TrainingCenterViewCategoryModel.fromJson(Map<String, dynamic> json) => _$TrainingCenterViewCategoryModelFromJson(json);

 final  List<TrainingCenterModel> _vip;
@override@JsonKey(name: 'Vip', defaultValue: []) List<TrainingCenterModel> get vip {
  if (_vip is EqualUnmodifiableListView) return _vip;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vip);
}

 final  List<TrainingCenterModel> _premium;
@override@JsonKey(name: 'Premium', defaultValue: []) List<TrainingCenterModel> get premium {
  if (_premium is EqualUnmodifiableListView) return _premium;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_premium);
}

 final  List<TrainingCenterModel> _normal;
@override@JsonKey(name: 'Normal', defaultValue: []) List<TrainingCenterModel> get normal {
  if (_normal is EqualUnmodifiableListView) return _normal;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_normal);
}


/// Create a copy of TrainingCenterViewCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCenterViewCategoryModelCopyWith<_TrainingCenterViewCategoryModel> get copyWith => __$TrainingCenterViewCategoryModelCopyWithImpl<_TrainingCenterViewCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingCenterViewCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingCenterViewCategoryModel&&const DeepCollectionEquality().equals(other._vip, _vip)&&const DeepCollectionEquality().equals(other._premium, _premium)&&const DeepCollectionEquality().equals(other._normal, _normal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_vip),const DeepCollectionEquality().hash(_premium),const DeepCollectionEquality().hash(_normal));

@override
String toString() {
  return 'TrainingCenterViewCategoryModel(vip: $vip, premium: $premium, normal: $normal)';
}


}

/// @nodoc
abstract mixin class _$TrainingCenterViewCategoryModelCopyWith<$Res> implements $TrainingCenterViewCategoryModelCopyWith<$Res> {
  factory _$TrainingCenterViewCategoryModelCopyWith(_TrainingCenterViewCategoryModel value, $Res Function(_TrainingCenterViewCategoryModel) _then) = __$TrainingCenterViewCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Vip', defaultValue: []) List<TrainingCenterModel> vip,@JsonKey(name: 'Premium', defaultValue: []) List<TrainingCenterModel> premium,@JsonKey(name: 'Normal', defaultValue: []) List<TrainingCenterModel> normal
});




}
/// @nodoc
class __$TrainingCenterViewCategoryModelCopyWithImpl<$Res>
    implements _$TrainingCenterViewCategoryModelCopyWith<$Res> {
  __$TrainingCenterViewCategoryModelCopyWithImpl(this._self, this._then);

  final _TrainingCenterViewCategoryModel _self;
  final $Res Function(_TrainingCenterViewCategoryModel) _then;

/// Create a copy of TrainingCenterViewCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vip = null,Object? premium = null,Object? normal = null,}) {
  return _then(_TrainingCenterViewCategoryModel(
vip: null == vip ? _self._vip : vip // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,premium: null == premium ? _self._premium : premium // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,normal: null == normal ? _self._normal : normal // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,
  ));
}


}

// dart format on
