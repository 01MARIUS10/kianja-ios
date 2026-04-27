// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobImageModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get url;@JsonKey(name: 'url_min', defaultValue: '') String get urlMin;
/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<JobImageModel> get copyWith => _$JobImageModelCopyWithImpl<JobImageModel>(this as JobImageModel, _$identity);

  /// Serializes this JobImageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlMin, urlMin) || other.urlMin == urlMin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,urlMin);

@override
String toString() {
  return 'JobImageModel(id: $id, name: $name, url: $url, urlMin: $urlMin)';
}


}

/// @nodoc
abstract mixin class $JobImageModelCopyWith<$Res>  {
  factory $JobImageModelCopyWith(JobImageModel value, $Res Function(JobImageModel) _then) = _$JobImageModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String url,@JsonKey(name: 'url_min', defaultValue: '') String urlMin
});




}
/// @nodoc
class _$JobImageModelCopyWithImpl<$Res>
    implements $JobImageModelCopyWith<$Res> {
  _$JobImageModelCopyWithImpl(this._self, this._then);

  final JobImageModel _self;
  final $Res Function(JobImageModel) _then;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? urlMin = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlMin: null == urlMin ? _self.urlMin : urlMin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobImageModel].
extension JobImageModelPatterns on JobImageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobImageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobImageModel value)  $default,){
final _that = this;
switch (_that) {
case _JobImageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobImageModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url, @JsonKey(name: 'url_min', defaultValue: '')  String urlMin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.urlMin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url, @JsonKey(name: 'url_min', defaultValue: '')  String urlMin)  $default,) {final _that = this;
switch (_that) {
case _JobImageModel():
return $default(_that.id,_that.name,_that.url,_that.urlMin);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url, @JsonKey(name: 'url_min', defaultValue: '')  String urlMin)?  $default,) {final _that = this;
switch (_that) {
case _JobImageModel() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.urlMin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobImageModel extends JobImageModel {
  const _JobImageModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.url, @JsonKey(name: 'url_min', defaultValue: '') required this.urlMin}): super._();
  factory _JobImageModel.fromJson(Map<String, dynamic> json) => _$JobImageModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String url;
@override@JsonKey(name: 'url_min', defaultValue: '') final  String urlMin;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobImageModelCopyWith<_JobImageModel> get copyWith => __$JobImageModelCopyWithImpl<_JobImageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobImageModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobImageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlMin, urlMin) || other.urlMin == urlMin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url,urlMin);

@override
String toString() {
  return 'JobImageModel(id: $id, name: $name, url: $url, urlMin: $urlMin)';
}


}

/// @nodoc
abstract mixin class _$JobImageModelCopyWith<$Res> implements $JobImageModelCopyWith<$Res> {
  factory _$JobImageModelCopyWith(_JobImageModel value, $Res Function(_JobImageModel) _then) = __$JobImageModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String url,@JsonKey(name: 'url_min', defaultValue: '') String urlMin
});




}
/// @nodoc
class __$JobImageModelCopyWithImpl<$Res>
    implements _$JobImageModelCopyWith<$Res> {
  __$JobImageModelCopyWithImpl(this._self, this._then);

  final _JobImageModel _self;
  final $Res Function(_JobImageModel) _then;

/// Create a copy of JobImageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? urlMin = null,}) {
  return _then(_JobImageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,urlMin: null == urlMin ? _self.urlMin : urlMin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
