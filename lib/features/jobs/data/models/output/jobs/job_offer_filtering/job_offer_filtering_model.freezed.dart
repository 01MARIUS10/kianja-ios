// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_offer_filtering_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobOfferFilteringModel {

@JsonKey(defaultValue: []) List<JobCategoryModel> get categories;@JsonKey(defaultValue: []) List<JobLocationModel> get locations;
/// Create a copy of JobOfferFilteringModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobOfferFilteringModelCopyWith<JobOfferFilteringModel> get copyWith => _$JobOfferFilteringModelCopyWithImpl<JobOfferFilteringModel>(this as JobOfferFilteringModel, _$identity);

  /// Serializes this JobOfferFilteringModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobOfferFilteringModel&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.locations, locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(locations));

@override
String toString() {
  return 'JobOfferFilteringModel(categories: $categories, locations: $locations)';
}


}

/// @nodoc
abstract mixin class $JobOfferFilteringModelCopyWith<$Res>  {
  factory $JobOfferFilteringModelCopyWith(JobOfferFilteringModel value, $Res Function(JobOfferFilteringModel) _then) = _$JobOfferFilteringModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: []) List<JobCategoryModel> categories,@JsonKey(defaultValue: []) List<JobLocationModel> locations
});




}
/// @nodoc
class _$JobOfferFilteringModelCopyWithImpl<$Res>
    implements $JobOfferFilteringModelCopyWith<$Res> {
  _$JobOfferFilteringModelCopyWithImpl(this._self, this._then);

  final JobOfferFilteringModel _self;
  final $Res Function(JobOfferFilteringModel) _then;

/// Create a copy of JobOfferFilteringModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? locations = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobOfferFilteringModel].
extension JobOfferFilteringModelPatterns on JobOfferFilteringModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobOfferFilteringModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobOfferFilteringModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobOfferFilteringModel value)  $default,){
final _that = this;
switch (_that) {
case _JobOfferFilteringModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobOfferFilteringModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobOfferFilteringModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(defaultValue: [])  List<JobLocationModel> locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobOfferFilteringModel() when $default != null:
return $default(_that.categories,_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(defaultValue: [])  List<JobLocationModel> locations)  $default,) {final _that = this;
switch (_that) {
case _JobOfferFilteringModel():
return $default(_that.categories,_that.locations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(defaultValue: [])  List<JobLocationModel> locations)?  $default,) {final _that = this;
switch (_that) {
case _JobOfferFilteringModel() when $default != null:
return $default(_that.categories,_that.locations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobOfferFilteringModel extends JobOfferFilteringModel {
  const _JobOfferFilteringModel({@JsonKey(defaultValue: []) required final  List<JobCategoryModel> categories, @JsonKey(defaultValue: []) required final  List<JobLocationModel> locations}): _categories = categories,_locations = locations,super._();
  factory _JobOfferFilteringModel.fromJson(Map<String, dynamic> json) => _$JobOfferFilteringModelFromJson(json);

 final  List<JobCategoryModel> _categories;
@override@JsonKey(defaultValue: []) List<JobCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<JobLocationModel> _locations;
@override@JsonKey(defaultValue: []) List<JobLocationModel> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}


/// Create a copy of JobOfferFilteringModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobOfferFilteringModelCopyWith<_JobOfferFilteringModel> get copyWith => __$JobOfferFilteringModelCopyWithImpl<_JobOfferFilteringModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobOfferFilteringModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobOfferFilteringModel&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._locations, _locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_locations));

@override
String toString() {
  return 'JobOfferFilteringModel(categories: $categories, locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$JobOfferFilteringModelCopyWith<$Res> implements $JobOfferFilteringModelCopyWith<$Res> {
  factory _$JobOfferFilteringModelCopyWith(_JobOfferFilteringModel value, $Res Function(_JobOfferFilteringModel) _then) = __$JobOfferFilteringModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: []) List<JobCategoryModel> categories,@JsonKey(defaultValue: []) List<JobLocationModel> locations
});




}
/// @nodoc
class __$JobOfferFilteringModelCopyWithImpl<$Res>
    implements _$JobOfferFilteringModelCopyWith<$Res> {
  __$JobOfferFilteringModelCopyWithImpl(this._self, this._then);

  final _JobOfferFilteringModel _self;
  final $Res Function(_JobOfferFilteringModel) _then;

/// Create a copy of JobOfferFilteringModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? locations = null,}) {
  return _then(_JobOfferFilteringModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,
  ));
}


}

// dart format on
