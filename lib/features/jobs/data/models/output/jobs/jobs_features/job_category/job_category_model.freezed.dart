// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobCategoryModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(name: 'nom', defaultValue: '') String get name;@JsonKey(name: 'icon', defaultValue: '') String get iconUrl;
/// Create a copy of JobCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCategoryModelCopyWith<JobCategoryModel> get copyWith => _$JobCategoryModelCopyWithImpl<JobCategoryModel>(this as JobCategoryModel, _$identity);

  /// Serializes this JobCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl);

@override
String toString() {
  return 'JobCategoryModel(id: $id, name: $name, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $JobCategoryModelCopyWith<$Res>  {
  factory $JobCategoryModelCopyWith(JobCategoryModel value, $Res Function(JobCategoryModel) _then) = _$JobCategoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name,@JsonKey(name: 'icon', defaultValue: '') String iconUrl
});




}
/// @nodoc
class _$JobCategoryModelCopyWithImpl<$Res>
    implements $JobCategoryModelCopyWith<$Res> {
  _$JobCategoryModelCopyWithImpl(this._self, this._then);

  final JobCategoryModel _self;
  final $Res Function(JobCategoryModel) _then;

/// Create a copy of JobCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobCategoryModel].
extension JobCategoryModelPatterns on JobCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _JobCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name, @JsonKey(name: 'icon', defaultValue: '')  String iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name, @JsonKey(name: 'icon', defaultValue: '')  String iconUrl)  $default,) {final _that = this;
switch (_that) {
case _JobCategoryModel():
return $default(_that.id,_that.name,_that.iconUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(name: 'nom', defaultValue: '')  String name, @JsonKey(name: 'icon', defaultValue: '')  String iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _JobCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobCategoryModel extends JobCategoryModel {
  const _JobCategoryModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(name: 'nom', defaultValue: '') required this.name, @JsonKey(name: 'icon', defaultValue: '') required this.iconUrl}): super._();
  factory _JobCategoryModel.fromJson(Map<String, dynamic> json) => _$JobCategoryModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(name: 'nom', defaultValue: '') final  String name;
@override@JsonKey(name: 'icon', defaultValue: '') final  String iconUrl;

/// Create a copy of JobCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCategoryModelCopyWith<_JobCategoryModel> get copyWith => __$JobCategoryModelCopyWithImpl<_JobCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,iconUrl);

@override
String toString() {
  return 'JobCategoryModel(id: $id, name: $name, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$JobCategoryModelCopyWith<$Res> implements $JobCategoryModelCopyWith<$Res> {
  factory _$JobCategoryModelCopyWith(_JobCategoryModel value, $Res Function(_JobCategoryModel) _then) = __$JobCategoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(name: 'nom', defaultValue: '') String name,@JsonKey(name: 'icon', defaultValue: '') String iconUrl
});




}
/// @nodoc
class __$JobCategoryModelCopyWithImpl<$Res>
    implements _$JobCategoryModelCopyWith<$Res> {
  __$JobCategoryModelCopyWithImpl(this._self, this._then);

  final _JobCategoryModel _self;
  final $Res Function(_JobCategoryModel) _then;

/// Create a copy of JobCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? iconUrl = null,}) {
  return _then(_JobCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
