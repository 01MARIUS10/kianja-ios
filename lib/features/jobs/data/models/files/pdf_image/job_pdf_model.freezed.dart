// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobPdfModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(defaultValue: '') String get url;
/// Create a copy of JobPdfModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobPdfModelCopyWith<JobPdfModel> get copyWith => _$JobPdfModelCopyWithImpl<JobPdfModel>(this as JobPdfModel, _$identity);

  /// Serializes this JobPdfModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobPdfModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url);

@override
String toString() {
  return 'JobPdfModel(id: $id, name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class $JobPdfModelCopyWith<$Res>  {
  factory $JobPdfModelCopyWith(JobPdfModel value, $Res Function(JobPdfModel) _then) = _$JobPdfModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String url
});




}
/// @nodoc
class _$JobPdfModelCopyWithImpl<$Res>
    implements $JobPdfModelCopyWith<$Res> {
  _$JobPdfModelCopyWithImpl(this._self, this._then);

  final JobPdfModel _self;
  final $Res Function(JobPdfModel) _then;

/// Create a copy of JobPdfModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobPdfModel].
extension JobPdfModelPatterns on JobPdfModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobPdfModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobPdfModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobPdfModel value)  $default,){
final _that = this;
switch (_that) {
case _JobPdfModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobPdfModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobPdfModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobPdfModel() when $default != null:
return $default(_that.id,_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url)  $default,) {final _that = this;
switch (_that) {
case _JobPdfModel():
return $default(_that.id,_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(defaultValue: '')  String url)?  $default,) {final _that = this;
switch (_that) {
case _JobPdfModel() when $default != null:
return $default(_that.id,_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobPdfModel extends JobPdfModel {
  const _JobPdfModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(defaultValue: '') required this.url}): super._();
  factory _JobPdfModel.fromJson(Map<String, dynamic> json) => _$JobPdfModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(defaultValue: '') final  String url;

/// Create a copy of JobPdfModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobPdfModelCopyWith<_JobPdfModel> get copyWith => __$JobPdfModelCopyWithImpl<_JobPdfModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobPdfModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobPdfModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,url);

@override
String toString() {
  return 'JobPdfModel(id: $id, name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$JobPdfModelCopyWith<$Res> implements $JobPdfModelCopyWith<$Res> {
  factory _$JobPdfModelCopyWith(_JobPdfModel value, $Res Function(_JobPdfModel) _then) = __$JobPdfModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(defaultValue: '') String url
});




}
/// @nodoc
class __$JobPdfModelCopyWithImpl<$Res>
    implements _$JobPdfModelCopyWith<$Res> {
  __$JobPdfModelCopyWithImpl(this._self, this._then);

  final _JobPdfModel _self;
  final $Res Function(_JobPdfModel) _then;

/// Create a copy of JobPdfModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,}) {
  return _then(_JobPdfModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
