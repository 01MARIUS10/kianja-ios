// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobPreferenceModel {

@JsonKey(name: 'showButton', defaultValue: false) bool get showPostButton;
/// Create a copy of JobPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPreferenceModelCopyWith<JobPreferenceModel> get copyWith => _$JobPreferenceModelCopyWithImpl<JobPreferenceModel>(this as JobPreferenceModel, _$identity);

  /// Serializes this JobPreferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPreferenceModel&&(identical(other.showPostButton, showPostButton) || other.showPostButton == showPostButton));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showPostButton);

@override
String toString() {
  return 'JobPreferenceModel(showPostButton: $showPostButton)';
}


}

/// @nodoc
abstract mixin class $JobPreferenceModelCopyWith<$Res>  {
  factory $JobPreferenceModelCopyWith(JobPreferenceModel value, $Res Function(JobPreferenceModel) _then) = _$JobPreferenceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'showButton', defaultValue: false) bool showPostButton
});




}
/// @nodoc
class _$JobPreferenceModelCopyWithImpl<$Res>
    implements $JobPreferenceModelCopyWith<$Res> {
  _$JobPreferenceModelCopyWithImpl(this._self, this._then);

  final JobPreferenceModel _self;
  final $Res Function(JobPreferenceModel) _then;

/// Create a copy of JobPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showPostButton = null,}) {
  return _then(_self.copyWith(
showPostButton: null == showPostButton ? _self.showPostButton : showPostButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [JobPreferenceModel].
extension JobPreferenceModelPatterns on JobPreferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPreferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPreferenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPreferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _JobPreferenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPreferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobPreferenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'showButton', defaultValue: false)  bool showPostButton)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPreferenceModel() when $default != null:
return $default(_that.showPostButton);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'showButton', defaultValue: false)  bool showPostButton)  $default,) {final _that = this;
switch (_that) {
case _JobPreferenceModel():
return $default(_that.showPostButton);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'showButton', defaultValue: false)  bool showPostButton)?  $default,) {final _that = this;
switch (_that) {
case _JobPreferenceModel() when $default != null:
return $default(_that.showPostButton);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPreferenceModel extends JobPreferenceModel {
  const _JobPreferenceModel({@JsonKey(name: 'showButton', defaultValue: false) required this.showPostButton}): super._();
  factory _JobPreferenceModel.fromJson(Map<String, dynamic> json) => _$JobPreferenceModelFromJson(json);

@override@JsonKey(name: 'showButton', defaultValue: false) final  bool showPostButton;

/// Create a copy of JobPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPreferenceModelCopyWith<_JobPreferenceModel> get copyWith => __$JobPreferenceModelCopyWithImpl<_JobPreferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPreferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPreferenceModel&&(identical(other.showPostButton, showPostButton) || other.showPostButton == showPostButton));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showPostButton);

@override
String toString() {
  return 'JobPreferenceModel(showPostButton: $showPostButton)';
}


}

/// @nodoc
abstract mixin class _$JobPreferenceModelCopyWith<$Res> implements $JobPreferenceModelCopyWith<$Res> {
  factory _$JobPreferenceModelCopyWith(_JobPreferenceModel value, $Res Function(_JobPreferenceModel) _then) = __$JobPreferenceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'showButton', defaultValue: false) bool showPostButton
});




}
/// @nodoc
class __$JobPreferenceModelCopyWithImpl<$Res>
    implements _$JobPreferenceModelCopyWith<$Res> {
  __$JobPreferenceModelCopyWithImpl(this._self, this._then);

  final _JobPreferenceModel _self;
  final $Res Function(_JobPreferenceModel) _then;

/// Create a copy of JobPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showPostButton = null,}) {
  return _then(_JobPreferenceModel(
showPostButton: null == showPostButton ? _self.showPostButton : showPostButton // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
