// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_center_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingCenterFilterModel {

@JsonKey(defaultValue: '') String get query;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'data', defaultValue: []) List<TrainingCenterModel> get trainingCenters;
/// Create a copy of TrainingCenterFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCenterFilterModelCopyWith<TrainingCenterFilterModel> get copyWith => _$TrainingCenterFilterModelCopyWithImpl<TrainingCenterFilterModel>(this as TrainingCenterFilterModel, _$identity);

  /// Serializes this TrainingCenterFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingCenterFilterModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.trainingCenters, trainingCenters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(trainingCenters));

@override
String toString() {
  return 'TrainingCenterFilterModel(query: $query, name: $name, trainingCenters: $trainingCenters)';
}


}

/// @nodoc
abstract mixin class $TrainingCenterFilterModelCopyWith<$Res>  {
  factory $TrainingCenterFilterModelCopyWith(TrainingCenterFilterModel value, $Res Function(TrainingCenterFilterModel) _then) = _$TrainingCenterFilterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<TrainingCenterModel> trainingCenters
});




}
/// @nodoc
class _$TrainingCenterFilterModelCopyWithImpl<$Res>
    implements $TrainingCenterFilterModelCopyWith<$Res> {
  _$TrainingCenterFilterModelCopyWithImpl(this._self, this._then);

  final TrainingCenterFilterModel _self;
  final $Res Function(TrainingCenterFilterModel) _then;

/// Create a copy of TrainingCenterFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? name = null,Object? trainingCenters = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trainingCenters: null == trainingCenters ? _self.trainingCenters : trainingCenters // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingCenterFilterModel].
extension TrainingCenterFilterModelPatterns on TrainingCenterFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingCenterFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingCenterFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingCenterFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingCenterFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<TrainingCenterModel> trainingCenters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingCenterFilterModel() when $default != null:
return $default(_that.query,_that.name,_that.trainingCenters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<TrainingCenterModel> trainingCenters)  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterFilterModel():
return $default(_that.query,_that.name,_that.trainingCenters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<TrainingCenterModel> trainingCenters)?  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterFilterModel() when $default != null:
return $default(_that.query,_that.name,_that.trainingCenters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingCenterFilterModel extends TrainingCenterFilterModel {
  const _TrainingCenterFilterModel({@JsonKey(defaultValue: '') required this.query, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'data', defaultValue: []) required final  List<TrainingCenterModel> trainingCenters}): _trainingCenters = trainingCenters,super._();
  factory _TrainingCenterFilterModel.fromJson(Map<String, dynamic> json) => _$TrainingCenterFilterModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String query;
@override@JsonKey(defaultValue: '') final  String name;
 final  List<TrainingCenterModel> _trainingCenters;
@override@JsonKey(name: 'data', defaultValue: []) List<TrainingCenterModel> get trainingCenters {
  if (_trainingCenters is EqualUnmodifiableListView) return _trainingCenters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingCenters);
}


/// Create a copy of TrainingCenterFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCenterFilterModelCopyWith<_TrainingCenterFilterModel> get copyWith => __$TrainingCenterFilterModelCopyWithImpl<_TrainingCenterFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingCenterFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingCenterFilterModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._trainingCenters, _trainingCenters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(_trainingCenters));

@override
String toString() {
  return 'TrainingCenterFilterModel(query: $query, name: $name, trainingCenters: $trainingCenters)';
}


}

/// @nodoc
abstract mixin class _$TrainingCenterFilterModelCopyWith<$Res> implements $TrainingCenterFilterModelCopyWith<$Res> {
  factory _$TrainingCenterFilterModelCopyWith(_TrainingCenterFilterModel value, $Res Function(_TrainingCenterFilterModel) _then) = __$TrainingCenterFilterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<TrainingCenterModel> trainingCenters
});




}
/// @nodoc
class __$TrainingCenterFilterModelCopyWithImpl<$Res>
    implements _$TrainingCenterFilterModelCopyWith<$Res> {
  __$TrainingCenterFilterModelCopyWithImpl(this._self, this._then);

  final _TrainingCenterFilterModel _self;
  final $Res Function(_TrainingCenterFilterModel) _then;

/// Create a copy of TrainingCenterFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? name = null,Object? trainingCenters = null,}) {
  return _then(_TrainingCenterFilterModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,trainingCenters: null == trainingCenters ? _self._trainingCenters : trainingCenters // ignore: cast_nullable_to_non_nullable
as List<TrainingCenterModel>,
  ));
}


}

// dart format on
