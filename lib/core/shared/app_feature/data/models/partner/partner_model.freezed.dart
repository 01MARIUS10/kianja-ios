// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnerModel {

@JsonKey(name: 'titre', defaultValue: '') String get title;@JsonKey(defaultValue: '') String get image;@JsonKey(name: 'url', defaultValue: '') String get pageUrl;
/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerModelCopyWith<PartnerModel> get copyWith => _$PartnerModelCopyWithImpl<PartnerModel>(this as PartnerModel, _$identity);

  /// Serializes this PartnerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerModel&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,image,pageUrl);

@override
String toString() {
  return 'PartnerModel(title: $title, image: $image, pageUrl: $pageUrl)';
}


}

/// @nodoc
abstract mixin class $PartnerModelCopyWith<$Res>  {
  factory $PartnerModelCopyWith(PartnerModel value, $Res Function(PartnerModel) _then) = _$PartnerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'titre', defaultValue: '') String title,@JsonKey(defaultValue: '') String image,@JsonKey(name: 'url', defaultValue: '') String pageUrl
});




}
/// @nodoc
class _$PartnerModelCopyWithImpl<$Res>
    implements $PartnerModelCopyWith<$Res> {
  _$PartnerModelCopyWithImpl(this._self, this._then);

  final PartnerModel _self;
  final $Res Function(PartnerModel) _then;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? image = null,Object? pageUrl = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,pageUrl: null == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerModel].
extension PartnerModelPatterns on PartnerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(defaultValue: '')  String image, @JsonKey(name: 'url', defaultValue: '')  String pageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
return $default(_that.title,_that.image,_that.pageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(defaultValue: '')  String image, @JsonKey(name: 'url', defaultValue: '')  String pageUrl)  $default,) {final _that = this;
switch (_that) {
case _PartnerModel():
return $default(_that.title,_that.image,_that.pageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(defaultValue: '')  String image, @JsonKey(name: 'url', defaultValue: '')  String pageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PartnerModel() when $default != null:
return $default(_that.title,_that.image,_that.pageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerModel extends PartnerModel {
  const _PartnerModel({@JsonKey(name: 'titre', defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.image, @JsonKey(name: 'url', defaultValue: '') required this.pageUrl}): super._();
  factory _PartnerModel.fromJson(Map<String, dynamic> json) => _$PartnerModelFromJson(json);

@override@JsonKey(name: 'titre', defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String image;
@override@JsonKey(name: 'url', defaultValue: '') final  String pageUrl;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerModelCopyWith<_PartnerModel> get copyWith => __$PartnerModelCopyWithImpl<_PartnerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerModel&&(identical(other.title, title) || other.title == title)&&(identical(other.image, image) || other.image == image)&&(identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,image,pageUrl);

@override
String toString() {
  return 'PartnerModel(title: $title, image: $image, pageUrl: $pageUrl)';
}


}

/// @nodoc
abstract mixin class _$PartnerModelCopyWith<$Res> implements $PartnerModelCopyWith<$Res> {
  factory _$PartnerModelCopyWith(_PartnerModel value, $Res Function(_PartnerModel) _then) = __$PartnerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'titre', defaultValue: '') String title,@JsonKey(defaultValue: '') String image,@JsonKey(name: 'url', defaultValue: '') String pageUrl
});




}
/// @nodoc
class __$PartnerModelCopyWithImpl<$Res>
    implements _$PartnerModelCopyWith<$Res> {
  __$PartnerModelCopyWithImpl(this._self, this._then);

  final _PartnerModel _self;
  final $Res Function(_PartnerModel) _then;

/// Create a copy of PartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? image = null,Object? pageUrl = null,}) {
  return _then(_PartnerModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,pageUrl: null == pageUrl ? _self.pageUrl : pageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
