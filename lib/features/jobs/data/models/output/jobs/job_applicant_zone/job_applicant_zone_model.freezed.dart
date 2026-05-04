// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_applicant_zone_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobApplicantZoneModel {

@JsonKey(defaultValue: '') String get query;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'data', defaultValue: []) List<JobApplicantModel> get jobApplicants;
/// Create a copy of JobApplicantZoneModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobApplicantZoneModelCopyWith<JobApplicantZoneModel> get copyWith => _$JobApplicantZoneModelCopyWithImpl<JobApplicantZoneModel>(this as JobApplicantZoneModel, _$identity);

  /// Serializes this JobApplicantZoneModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobApplicantZoneModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.jobApplicants, jobApplicants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(jobApplicants));

@override
String toString() {
  return 'JobApplicantZoneModel(query: $query, name: $name, jobApplicants: $jobApplicants)';
}


}

/// @nodoc
abstract mixin class $JobApplicantZoneModelCopyWith<$Res>  {
  factory $JobApplicantZoneModelCopyWith(JobApplicantZoneModel value, $Res Function(JobApplicantZoneModel) _then) = _$JobApplicantZoneModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<JobApplicantModel> jobApplicants
});




}
/// @nodoc
class _$JobApplicantZoneModelCopyWithImpl<$Res>
    implements $JobApplicantZoneModelCopyWith<$Res> {
  _$JobApplicantZoneModelCopyWithImpl(this._self, this._then);

  final JobApplicantZoneModel _self;
  final $Res Function(JobApplicantZoneModel) _then;

/// Create a copy of JobApplicantZoneModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? name = null,Object? jobApplicants = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobApplicants: null == jobApplicants ? _self.jobApplicants : jobApplicants // ignore: cast_nullable_to_non_nullable
as List<JobApplicantModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobApplicantZoneModel].
extension JobApplicantZoneModelPatterns on JobApplicantZoneModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobApplicantZoneModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobApplicantZoneModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobApplicantZoneModel value)  $default,){
final _that = this;
switch (_that) {
case _JobApplicantZoneModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobApplicantZoneModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobApplicantZoneModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobApplicantModel> jobApplicants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobApplicantZoneModel() when $default != null:
return $default(_that.query,_that.name,_that.jobApplicants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobApplicantModel> jobApplicants)  $default,) {final _that = this;
switch (_that) {
case _JobApplicantZoneModel():
return $default(_that.query,_that.name,_that.jobApplicants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobApplicantModel> jobApplicants)?  $default,) {final _that = this;
switch (_that) {
case _JobApplicantZoneModel() when $default != null:
return $default(_that.query,_that.name,_that.jobApplicants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobApplicantZoneModel extends JobApplicantZoneModel {
  const _JobApplicantZoneModel({@JsonKey(defaultValue: '') required this.query, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'data', defaultValue: []) required final  List<JobApplicantModel> jobApplicants}): _jobApplicants = jobApplicants,super._();
  factory _JobApplicantZoneModel.fromJson(Map<String, dynamic> json) => _$JobApplicantZoneModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String query;
@override@JsonKey(defaultValue: '') final  String name;
 final  List<JobApplicantModel> _jobApplicants;
@override@JsonKey(name: 'data', defaultValue: []) List<JobApplicantModel> get jobApplicants {
  if (_jobApplicants is EqualUnmodifiableListView) return _jobApplicants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobApplicants);
}


/// Create a copy of JobApplicantZoneModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobApplicantZoneModelCopyWith<_JobApplicantZoneModel> get copyWith => __$JobApplicantZoneModelCopyWithImpl<_JobApplicantZoneModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobApplicantZoneModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobApplicantZoneModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._jobApplicants, _jobApplicants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(_jobApplicants));

@override
String toString() {
  return 'JobApplicantZoneModel(query: $query, name: $name, jobApplicants: $jobApplicants)';
}


}

/// @nodoc
abstract mixin class _$JobApplicantZoneModelCopyWith<$Res> implements $JobApplicantZoneModelCopyWith<$Res> {
  factory _$JobApplicantZoneModelCopyWith(_JobApplicantZoneModel value, $Res Function(_JobApplicantZoneModel) _then) = __$JobApplicantZoneModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<JobApplicantModel> jobApplicants
});




}
/// @nodoc
class __$JobApplicantZoneModelCopyWithImpl<$Res>
    implements _$JobApplicantZoneModelCopyWith<$Res> {
  __$JobApplicantZoneModelCopyWithImpl(this._self, this._then);

  final _JobApplicantZoneModel _self;
  final $Res Function(_JobApplicantZoneModel) _then;

/// Create a copy of JobApplicantZoneModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? name = null,Object? jobApplicants = null,}) {
  return _then(_JobApplicantZoneModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobApplicants: null == jobApplicants ? _self._jobApplicants : jobApplicants // ignore: cast_nullable_to_non_nullable
as List<JobApplicantModel>,
  ));
}


}

// dart format on
