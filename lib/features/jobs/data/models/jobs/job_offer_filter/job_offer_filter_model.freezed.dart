// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_offer_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobOfferFilterModel {

@JsonKey(defaultValue: '') String get query;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'data', defaultValue: []) List<JobOfferModel> get jobOffers;
/// Create a copy of JobOfferFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobOfferFilterModelCopyWith<JobOfferFilterModel> get copyWith => _$JobOfferFilterModelCopyWithImpl<JobOfferFilterModel>(this as JobOfferFilterModel, _$identity);

  /// Serializes this JobOfferFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobOfferFilterModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.jobOffers, jobOffers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(jobOffers));

@override
String toString() {
  return 'JobOfferFilterModel(query: $query, name: $name, jobOffers: $jobOffers)';
}


}

/// @nodoc
abstract mixin class $JobOfferFilterModelCopyWith<$Res>  {
  factory $JobOfferFilterModelCopyWith(JobOfferFilterModel value, $Res Function(JobOfferFilterModel) _then) = _$JobOfferFilterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<JobOfferModel> jobOffers
});




}
/// @nodoc
class _$JobOfferFilterModelCopyWithImpl<$Res>
    implements $JobOfferFilterModelCopyWith<$Res> {
  _$JobOfferFilterModelCopyWithImpl(this._self, this._then);

  final JobOfferFilterModel _self;
  final $Res Function(JobOfferFilterModel) _then;

/// Create a copy of JobOfferFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? name = null,Object? jobOffers = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobOffers: null == jobOffers ? _self.jobOffers : jobOffers // ignore: cast_nullable_to_non_nullable
as List<JobOfferModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobOfferFilterModel].
extension JobOfferFilterModelPatterns on JobOfferFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobOfferFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobOfferFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobOfferFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _JobOfferFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobOfferFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobOfferFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobOfferModel> jobOffers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobOfferFilterModel() when $default != null:
return $default(_that.query,_that.name,_that.jobOffers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobOfferModel> jobOffers)  $default,) {final _that = this;
switch (_that) {
case _JobOfferFilterModel():
return $default(_that.query,_that.name,_that.jobOffers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: '')  String query, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'data', defaultValue: [])  List<JobOfferModel> jobOffers)?  $default,) {final _that = this;
switch (_that) {
case _JobOfferFilterModel() when $default != null:
return $default(_that.query,_that.name,_that.jobOffers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobOfferFilterModel extends JobOfferFilterModel {
  const _JobOfferFilterModel({@JsonKey(defaultValue: '') required this.query, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'data', defaultValue: []) required final  List<JobOfferModel> jobOffers}): _jobOffers = jobOffers,super._();
  factory _JobOfferFilterModel.fromJson(Map<String, dynamic> json) => _$JobOfferFilterModelFromJson(json);

@override@JsonKey(defaultValue: '') final  String query;
@override@JsonKey(defaultValue: '') final  String name;
 final  List<JobOfferModel> _jobOffers;
@override@JsonKey(name: 'data', defaultValue: []) List<JobOfferModel> get jobOffers {
  if (_jobOffers is EqualUnmodifiableListView) return _jobOffers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_jobOffers);
}


/// Create a copy of JobOfferFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobOfferFilterModelCopyWith<_JobOfferFilterModel> get copyWith => __$JobOfferFilterModelCopyWithImpl<_JobOfferFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobOfferFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobOfferFilterModel&&(identical(other.query, query) || other.query == query)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._jobOffers, _jobOffers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query,name,const DeepCollectionEquality().hash(_jobOffers));

@override
String toString() {
  return 'JobOfferFilterModel(query: $query, name: $name, jobOffers: $jobOffers)';
}


}

/// @nodoc
abstract mixin class _$JobOfferFilterModelCopyWith<$Res> implements $JobOfferFilterModelCopyWith<$Res> {
  factory _$JobOfferFilterModelCopyWith(_JobOfferFilterModel value, $Res Function(_JobOfferFilterModel) _then) = __$JobOfferFilterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: '') String query,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'data', defaultValue: []) List<JobOfferModel> jobOffers
});




}
/// @nodoc
class __$JobOfferFilterModelCopyWithImpl<$Res>
    implements _$JobOfferFilterModelCopyWith<$Res> {
  __$JobOfferFilterModelCopyWithImpl(this._self, this._then);

  final _JobOfferFilterModel _self;
  final $Res Function(_JobOfferFilterModel) _then;

/// Create a copy of JobOfferFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? name = null,Object? jobOffers = null,}) {
  return _then(_JobOfferFilterModel(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,jobOffers: null == jobOffers ? _self._jobOffers : jobOffers // ignore: cast_nullable_to_non_nullable
as List<JobOfferModel>,
  ));
}


}

// dart format on
