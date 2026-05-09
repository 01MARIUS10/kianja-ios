// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_applicant_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobApplicantPlanModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: 0) int get price; JobTypeModel get type; JobDurationModel get duration;
/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantPlanModelCopyWith<JobApplicantPlanModel> get copyWith => _$JobApplicantPlanModelCopyWithImpl<JobApplicantPlanModel>(this as JobApplicantPlanModel, _$identity);

  /// Serializes this JobApplicantPlanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantPlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.type, type) || other.type == type)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,type,duration);

@override
String toString() {
  return 'JobApplicantPlanModel(id: $id, price: $price, type: $type, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $JobApplicantPlanModelCopyWith<$Res>  {
  factory $JobApplicantPlanModelCopyWith(JobApplicantPlanModel value, $Res Function(JobApplicantPlanModel) _then) = _$JobApplicantPlanModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: 0) int price, JobTypeModel type, JobDurationModel duration
});


$JobTypeModelCopyWith<$Res> get type;$JobDurationModelCopyWith<$Res> get duration;

}
/// @nodoc
class _$JobApplicantPlanModelCopyWithImpl<$Res>
    implements $JobApplicantPlanModelCopyWith<$Res> {
  _$JobApplicantPlanModelCopyWithImpl(this._self, this._then);

  final JobApplicantPlanModel _self;
  final $Res Function(JobApplicantPlanModel) _then;

/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? price = null,Object? type = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as JobTypeModel,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as JobDurationModel,
  ));
}
/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobTypeModelCopyWith<$Res> get type {
  
  return $JobTypeModelCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDurationModelCopyWith<$Res> get duration {
  
  return $JobDurationModelCopyWith<$Res>(_self.duration, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}


/// Adds pattern-matching-related methods to [JobApplicantPlanModel].
extension JobApplicantPlanModelPatterns on JobApplicantPlanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicantPlanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicantPlanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicantPlanModel value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicantPlanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicantPlanModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicantPlanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: 0)  int price,  JobTypeModel type,  JobDurationModel duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantPlanModel() when $default != null:
return $default(_that.id,_that.price,_that.type,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: 0)  int price,  JobTypeModel type,  JobDurationModel duration)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantPlanModel():
return $default(_that.id,_that.price,_that.type,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: 0)  int price,  JobTypeModel type,  JobDurationModel duration)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantPlanModel() when $default != null:
return $default(_that.id,_that.price,_that.type,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantPlanModel extends JobApplicantPlanModel {
  const _JobApplicantPlanModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: 0) required this.price, required this.type, required this.duration}): super._();
  factory _JobApplicantPlanModel.fromJson(Map<String, dynamic> json) => _$JobApplicantPlanModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: 0) final  int price;
@override final  JobTypeModel type;
@override final  JobDurationModel duration;

/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobApplicantPlanModelCopyWith<_JobApplicantPlanModel> get copyWith => __$JobApplicantPlanModelCopyWithImpl<_JobApplicantPlanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobApplicantPlanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantPlanModel&&(identical(other.id, id) || other.id == id)&&(identical(other.price, price) || other.price == price)&&(identical(other.type, type) || other.type == type)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,price,type,duration);

@override
String toString() {
  return 'JobApplicantPlanModel(id: $id, price: $price, type: $type, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantPlanModelCopyWith<$Res> implements $JobApplicantPlanModelCopyWith<$Res> {
  factory _$JobApplicantPlanModelCopyWith(_JobApplicantPlanModel value, $Res Function(_JobApplicantPlanModel) _then) = __$JobApplicantPlanModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: 0) int price, JobTypeModel type, JobDurationModel duration
});


@override $JobTypeModelCopyWith<$Res> get type;@override $JobDurationModelCopyWith<$Res> get duration;

}
/// @nodoc
class __$JobApplicantPlanModelCopyWithImpl<$Res>
    implements _$JobApplicantPlanModelCopyWith<$Res> {
  __$JobApplicantPlanModelCopyWithImpl(this._self, this._then);

  final _JobApplicantPlanModel _self;
  final $Res Function(_JobApplicantPlanModel) _then;

/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? price = null,Object? type = null,Object? duration = null,}) {
  return _then(_JobApplicantPlanModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as JobTypeModel,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as JobDurationModel,
  ));
}

/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobTypeModelCopyWith<$Res> get type {
  
  return $JobTypeModelCopyWith<$Res>(_self.type, (value) {
    return _then(_self.copyWith(type: value));
  });
}/// Create a copy of JobApplicantPlanModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDurationModelCopyWith<$Res> get duration {
  
  return $JobDurationModelCopyWith<$Res>(_self.duration, (value) {
    return _then(_self.copyWith(duration: value));
  });
}
}

// dart format on
