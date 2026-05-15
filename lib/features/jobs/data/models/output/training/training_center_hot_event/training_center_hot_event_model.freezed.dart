// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_center_hot_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingCenterHotEventModel {

@JsonKey(defaultValue: '') String get query;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'data', defaultValue: []) List<HotEventModel> get hotEvents;
/// Create a copy of TrainingCenterHotEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCenterHotEventModelCopyWith<TrainingCenterHotEventModel> get copyWith => _$TrainingCenterHotEventModelCopyWithImpl<TrainingCenterHotEventModel>(this as TrainingCenterHotEventModel, _$identity);

  /// Serializes this TrainingCenterHotEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingCenterHotEventModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.hotEvents, hotEvents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(hotEvents));

@override
String toString() {
  return 'TrainingCenterHotEventModel(query: $query, name: $name, hotEvents: $hotEvents)';
}


}

/// @nodoc
abstract mixin class $TrainingCenterHotEventModelCopyWith<$Res>  {
  factory $TrainingCenterHotEventModelCopyWith(TrainingCenterHotEventModel value, $Res Function(TrainingCenterHotEventModel) _then) = _$TrainingCenterHotEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<HotEventModel> hotEvents
});




}
/// @nodoc
class _$TrainingCenterHotEventModelCopyWithImpl<$Res>
    implements $TrainingCenterHotEventModelCopyWith<$Res> {
  _$TrainingCenterHotEventModelCopyWithImpl(this._self, this._then);

  final TrainingCenterHotEventModel _self;
  final $Res Function(TrainingCenterHotEventModel) _then;

/// Create a copy of TrainingCenterHotEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? name = null,Object? hotEvents = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hotEvents: null == hotEvents ? _self.hotEvents : hotEvents // ignore: cast_nullable_to_non_nullable
as List<HotEventModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingCenterHotEventModel].
extension TrainingCenterHotEventModelPatterns on TrainingCenterHotEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingCenterHotEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingCenterHotEventModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingCenterHotEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<HotEventModel> hotEvents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel() when $default != null:
return $default(_that.query,_that.name,_that.hotEvents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<HotEventModel> hotEvents)  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel():
return $default(_that.query,_that.name,_that.hotEvents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<HotEventModel> hotEvents)?  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterHotEventModel() when $default != null:
return $default(_that.query,_that.name,_that.hotEvents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingCenterHotEventModel extends TrainingCenterHotEventModel {
  const _TrainingCenterHotEventModel({@JsonKey(defaultValue: '') required this.query, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'data', defaultValue: []) required final  List<HotEventModel> hotEvents}): _hotEvents = hotEvents,super._();
  factory _TrainingCenterHotEventModel.fromJson(Map<String, dynamic> json) => _$TrainingCenterHotEventModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String query;
@override@JsonKey(defaultValue: '') final  String name;
 final  List<HotEventModel> _hotEvents;
@override@JsonKey(name: 'data', defaultValue: []) List<HotEventModel> get hotEvents {
  if (_hotEvents is EqualUnmodifiableListView) return _hotEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hotEvents);
}


/// Create a copy of TrainingCenterHotEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCenterHotEventModelCopyWith<_TrainingCenterHotEventModel> get copyWith => __$TrainingCenterHotEventModelCopyWithImpl<_TrainingCenterHotEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingCenterHotEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingCenterHotEventModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._hotEvents, _hotEvents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(_hotEvents));

@override
String toString() {
  return 'TrainingCenterHotEventModel(query: $query, name: $name, hotEvents: $hotEvents)';
}


}

/// @nodoc
abstract mixin class _$TrainingCenterHotEventModelCopyWith<$Res> implements $TrainingCenterHotEventModelCopyWith<$Res> {
  factory _$TrainingCenterHotEventModelCopyWith(_TrainingCenterHotEventModel value, $Res Function(_TrainingCenterHotEventModel) _then) = __$TrainingCenterHotEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<HotEventModel> hotEvents
});




}
/// @nodoc
class __$TrainingCenterHotEventModelCopyWithImpl<$Res>
    implements _$TrainingCenterHotEventModelCopyWith<$Res> {
  __$TrainingCenterHotEventModelCopyWithImpl(this._self, this._then);

  final _TrainingCenterHotEventModel _self;
  final $Res Function(_TrainingCenterHotEventModel) _then;

/// Create a copy of TrainingCenterHotEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? name = null,Object? hotEvents = null,}) {
  return _then(_TrainingCenterHotEventModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hotEvents: null == hotEvents ? _self._hotEvents : hotEvents // ignore: cast_nullable_to_non_nullable
as List<HotEventModel>,
  ));
}


}

// dart format on
