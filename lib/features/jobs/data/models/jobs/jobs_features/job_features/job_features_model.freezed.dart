// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_features_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobFeaturesModel {

@JsonKey(name: 'Category', defaultValue: []) List<JobCategoryModel> get categories;@JsonKey(name: 'Domain', defaultValue: []) List<JobDomainModel> get domains;@JsonKey(name: 'Location', defaultValue: []) List<JobLocationModel> get locations;@JsonKey(name: 'Gender', defaultValue: []) List<JobGenderModel> get genders;@JsonKey(name: 'Actor', defaultValue: []) List<JobActorModel> get actors;@JsonKey(name: 'AbonnementType', defaultValue: []) List<JobAbonnementTypeModel> get abonnementTypes;@JsonKey(name: 'AbonnementDuration', defaultValue: []) List<JobAbonnementDurationModel> get abonnementDurations;
/// Create a copy of JobFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobFeaturesModelCopyWith<JobFeaturesModel> get copyWith => _$JobFeaturesModelCopyWithImpl<JobFeaturesModel>(this as JobFeaturesModel, _$identity);

  /// Serializes this JobFeaturesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobFeaturesModel&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.domains, domains)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.genders, genders)&&const DeepCollectionEquality().equals(other.actors, actors)&&const DeepCollectionEquality().equals(other.abonnementTypes, abonnementTypes)&&const DeepCollectionEquality().equals(other.abonnementDurations, abonnementDurations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(domains),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(genders),const DeepCollectionEquality().hash(actors),const DeepCollectionEquality().hash(abonnementTypes),const DeepCollectionEquality().hash(abonnementDurations));

@override
String toString() {
  return 'JobFeaturesModel(categories: $categories, domains: $domains, locations: $locations, genders: $genders, actors: $actors, abonnementTypes: $abonnementTypes, abonnementDurations: $abonnementDurations)';
}


}

/// @nodoc
abstract mixin class $JobFeaturesModelCopyWith<$Res>  {
  factory $JobFeaturesModelCopyWith(JobFeaturesModel value, $Res Function(JobFeaturesModel) _then) = _$JobFeaturesModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Category', defaultValue: []) List<JobCategoryModel> categories,@JsonKey(name: 'Domain', defaultValue: []) List<JobDomainModel> domains,@JsonKey(name: 'Location', defaultValue: []) List<JobLocationModel> locations,@JsonKey(name: 'Gender', defaultValue: []) List<JobGenderModel> genders,@JsonKey(name: 'Actor', defaultValue: []) List<JobActorModel> actors,@JsonKey(name: 'AbonnementType', defaultValue: []) List<JobAbonnementTypeModel> abonnementTypes,@JsonKey(name: 'AbonnementDuration', defaultValue: []) List<JobAbonnementDurationModel> abonnementDurations
});




}
/// @nodoc
class _$JobFeaturesModelCopyWithImpl<$Res>
    implements $JobFeaturesModelCopyWith<$Res> {
  _$JobFeaturesModelCopyWithImpl(this._self, this._then);

  final JobFeaturesModel _self;
  final $Res Function(JobFeaturesModel) _then;

/// Create a copy of JobFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? domains = null,Object? locations = null,Object? genders = null,Object? actors = null,Object? abonnementTypes = null,Object? abonnementDurations = null,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,domains: null == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<JobDomainModel>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,genders: null == genders ? _self.genders : genders // ignore: cast_nullable_to_non_nullable
as List<JobGenderModel>,actors: null == actors ? _self.actors : actors // ignore: cast_nullable_to_non_nullable
as List<JobActorModel>,abonnementTypes: null == abonnementTypes ? _self.abonnementTypes : abonnementTypes // ignore: cast_nullable_to_non_nullable
as List<JobAbonnementTypeModel>,abonnementDurations: null == abonnementDurations ? _self.abonnementDurations : abonnementDurations // ignore: cast_nullable_to_non_nullable
as List<JobAbonnementDurationModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [JobFeaturesModel].
extension JobFeaturesModelPatterns on JobFeaturesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobFeaturesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobFeaturesModel value)  $default,){
final _that = this;
switch (_that) {
case _JobFeaturesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobFeaturesModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobFeaturesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Category', defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(name: 'Domain', defaultValue: [])  List<JobDomainModel> domains, @JsonKey(name: 'Location', defaultValue: [])  List<JobLocationModel> locations, @JsonKey(name: 'Gender', defaultValue: [])  List<JobGenderModel> genders, @JsonKey(name: 'Actor', defaultValue: [])  List<JobActorModel> actors, @JsonKey(name: 'AbonnementType', defaultValue: [])  List<JobAbonnementTypeModel> abonnementTypes, @JsonKey(name: 'AbonnementDuration', defaultValue: [])  List<JobAbonnementDurationModel> abonnementDurations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobFeaturesModel() when $default != null:
return $default(_that.categories,_that.domains,_that.locations,_that.genders,_that.actors,_that.abonnementTypes,_that.abonnementDurations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Category', defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(name: 'Domain', defaultValue: [])  List<JobDomainModel> domains, @JsonKey(name: 'Location', defaultValue: [])  List<JobLocationModel> locations, @JsonKey(name: 'Gender', defaultValue: [])  List<JobGenderModel> genders, @JsonKey(name: 'Actor', defaultValue: [])  List<JobActorModel> actors, @JsonKey(name: 'AbonnementType', defaultValue: [])  List<JobAbonnementTypeModel> abonnementTypes, @JsonKey(name: 'AbonnementDuration', defaultValue: [])  List<JobAbonnementDurationModel> abonnementDurations)  $default,) {final _that = this;
switch (_that) {
case _JobFeaturesModel():
return $default(_that.categories,_that.domains,_that.locations,_that.genders,_that.actors,_that.abonnementTypes,_that.abonnementDurations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Category', defaultValue: [])  List<JobCategoryModel> categories, @JsonKey(name: 'Domain', defaultValue: [])  List<JobDomainModel> domains, @JsonKey(name: 'Location', defaultValue: [])  List<JobLocationModel> locations, @JsonKey(name: 'Gender', defaultValue: [])  List<JobGenderModel> genders, @JsonKey(name: 'Actor', defaultValue: [])  List<JobActorModel> actors, @JsonKey(name: 'AbonnementType', defaultValue: [])  List<JobAbonnementTypeModel> abonnementTypes, @JsonKey(name: 'AbonnementDuration', defaultValue: [])  List<JobAbonnementDurationModel> abonnementDurations)?  $default,) {final _that = this;
switch (_that) {
case _JobFeaturesModel() when $default != null:
return $default(_that.categories,_that.domains,_that.locations,_that.genders,_that.actors,_that.abonnementTypes,_that.abonnementDurations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobFeaturesModel extends JobFeaturesModel {
  const _JobFeaturesModel({@JsonKey(name: 'Category', defaultValue: []) required final  List<JobCategoryModel> categories, @JsonKey(name: 'Domain', defaultValue: []) required final  List<JobDomainModel> domains, @JsonKey(name: 'Location', defaultValue: []) required final  List<JobLocationModel> locations, @JsonKey(name: 'Gender', defaultValue: []) required final  List<JobGenderModel> genders, @JsonKey(name: 'Actor', defaultValue: []) required final  List<JobActorModel> actors, @JsonKey(name: 'AbonnementType', defaultValue: []) required final  List<JobAbonnementTypeModel> abonnementTypes, @JsonKey(name: 'AbonnementDuration', defaultValue: []) required final  List<JobAbonnementDurationModel> abonnementDurations}): _categories = categories,_domains = domains,_locations = locations,_genders = genders,_actors = actors,_abonnementTypes = abonnementTypes,_abonnementDurations = abonnementDurations,super._();
  factory _JobFeaturesModel.fromJson(Map<String, dynamic> json) => _$JobFeaturesModelFromJson(json);

 final  List<JobCategoryModel> _categories;
@override@JsonKey(name: 'Category', defaultValue: []) List<JobCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<JobDomainModel> _domains;
@override@JsonKey(name: 'Domain', defaultValue: []) List<JobDomainModel> get domains {
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_domains);
}

 final  List<JobLocationModel> _locations;
@override@JsonKey(name: 'Location', defaultValue: []) List<JobLocationModel> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<JobGenderModel> _genders;
@override@JsonKey(name: 'Gender', defaultValue: []) List<JobGenderModel> get genders {
  if (_genders is EqualUnmodifiableListView) return _genders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genders);
}

 final  List<JobActorModel> _actors;
@override@JsonKey(name: 'Actor', defaultValue: []) List<JobActorModel> get actors {
  if (_actors is EqualUnmodifiableListView) return _actors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_actors);
}

 final  List<JobAbonnementTypeModel> _abonnementTypes;
@override@JsonKey(name: 'AbonnementType', defaultValue: []) List<JobAbonnementTypeModel> get abonnementTypes {
  if (_abonnementTypes is EqualUnmodifiableListView) return _abonnementTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abonnementTypes);
}

 final  List<JobAbonnementDurationModel> _abonnementDurations;
@override@JsonKey(name: 'AbonnementDuration', defaultValue: []) List<JobAbonnementDurationModel> get abonnementDurations {
  if (_abonnementDurations is EqualUnmodifiableListView) return _abonnementDurations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_abonnementDurations);
}


/// Create a copy of JobFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobFeaturesModelCopyWith<_JobFeaturesModel> get copyWith => __$JobFeaturesModelCopyWithImpl<_JobFeaturesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobFeaturesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobFeaturesModel&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._domains, _domains)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._genders, _genders)&&const DeepCollectionEquality().equals(other._actors, _actors)&&const DeepCollectionEquality().equals(other._abonnementTypes, _abonnementTypes)&&const DeepCollectionEquality().equals(other._abonnementDurations, _abonnementDurations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_domains),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_genders),const DeepCollectionEquality().hash(_actors),const DeepCollectionEquality().hash(_abonnementTypes),const DeepCollectionEquality().hash(_abonnementDurations));

@override
String toString() {
  return 'JobFeaturesModel(categories: $categories, domains: $domains, locations: $locations, genders: $genders, actors: $actors, abonnementTypes: $abonnementTypes, abonnementDurations: $abonnementDurations)';
}


}

/// @nodoc
abstract mixin class _$JobFeaturesModelCopyWith<$Res> implements $JobFeaturesModelCopyWith<$Res> {
  factory _$JobFeaturesModelCopyWith(_JobFeaturesModel value, $Res Function(_JobFeaturesModel) _then) = __$JobFeaturesModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Category', defaultValue: []) List<JobCategoryModel> categories,@JsonKey(name: 'Domain', defaultValue: []) List<JobDomainModel> domains,@JsonKey(name: 'Location', defaultValue: []) List<JobLocationModel> locations,@JsonKey(name: 'Gender', defaultValue: []) List<JobGenderModel> genders,@JsonKey(name: 'Actor', defaultValue: []) List<JobActorModel> actors,@JsonKey(name: 'AbonnementType', defaultValue: []) List<JobAbonnementTypeModel> abonnementTypes,@JsonKey(name: 'AbonnementDuration', defaultValue: []) List<JobAbonnementDurationModel> abonnementDurations
});




}
/// @nodoc
class __$JobFeaturesModelCopyWithImpl<$Res>
    implements _$JobFeaturesModelCopyWith<$Res> {
  __$JobFeaturesModelCopyWithImpl(this._self, this._then);

  final _JobFeaturesModel _self;
  final $Res Function(_JobFeaturesModel) _then;

/// Create a copy of JobFeaturesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? domains = null,Object? locations = null,Object? genders = null,Object? actors = null,Object? abonnementTypes = null,Object? abonnementDurations = null,}) {
  return _then(_JobFeaturesModel(
categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<JobCategoryModel>,domains: null == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<JobDomainModel>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<JobLocationModel>,genders: null == genders ? _self._genders : genders // ignore: cast_nullable_to_non_nullable
as List<JobGenderModel>,actors: null == actors ? _self._actors : actors // ignore: cast_nullable_to_non_nullable
as List<JobActorModel>,abonnementTypes: null == abonnementTypes ? _self._abonnementTypes : abonnementTypes // ignore: cast_nullable_to_non_nullable
as List<JobAbonnementTypeModel>,abonnementDurations: null == abonnementDurations ? _self._abonnementDurations : abonnementDurations // ignore: cast_nullable_to_non_nullable
as List<JobAbonnementDurationModel>,
  ));
}


}

// dart format on
