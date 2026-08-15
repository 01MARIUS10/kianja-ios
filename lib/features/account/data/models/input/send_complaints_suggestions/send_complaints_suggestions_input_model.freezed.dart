// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_complaints_suggestions_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendComplaintsSuggestionsInputModel {

@JsonKey(name: 'titre', defaultValue: '') String get title;@JsonKey(name: 'description_detaille', defaultValue: '') String get description;@JsonKey(name: 'imagesId', defaultValue: []) List<int>? get imageIds;
/// Create a copy of SendComplaintsSuggestionsInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendComplaintsSuggestionsInputModelCopyWith<SendComplaintsSuggestionsInputModel> get copyWith => _$SendComplaintsSuggestionsInputModelCopyWithImpl<SendComplaintsSuggestionsInputModel>(this as SendComplaintsSuggestionsInputModel, _$identity);

  /// Serializes this SendComplaintsSuggestionsInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendComplaintsSuggestionsInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.imageIds, imageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(imageIds));

@override
String toString() {
  return 'SendComplaintsSuggestionsInputModel(title: $title, description: $description, imageIds: $imageIds)';
}


}

/// @nodoc
abstract mixin class $SendComplaintsSuggestionsInputModelCopyWith<$Res>  {
  factory $SendComplaintsSuggestionsInputModelCopyWith(SendComplaintsSuggestionsInputModel value, $Res Function(SendComplaintsSuggestionsInputModel) _then) = _$SendComplaintsSuggestionsInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'titre', defaultValue: '') String title,@JsonKey(name: 'description_detaille', defaultValue: '') String description,@JsonKey(name: 'imagesId', defaultValue: []) List<int>? imageIds
});




}
/// @nodoc
class _$SendComplaintsSuggestionsInputModelCopyWithImpl<$Res>
    implements $SendComplaintsSuggestionsInputModelCopyWith<$Res> {
  _$SendComplaintsSuggestionsInputModelCopyWithImpl(this._self, this._then);

  final SendComplaintsSuggestionsInputModel _self;
  final $Res Function(SendComplaintsSuggestionsInputModel) _then;

/// Create a copy of SendComplaintsSuggestionsInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? imageIds = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageIds: freezed == imageIds ? _self.imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendComplaintsSuggestionsInputModel].
extension SendComplaintsSuggestionsInputModelPatterns on SendComplaintsSuggestionsInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendComplaintsSuggestionsInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendComplaintsSuggestionsInputModel value)  $default,){
final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendComplaintsSuggestionsInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(name: 'description_detaille', defaultValue: '')  String description, @JsonKey(name: 'imagesId', defaultValue: [])  List<int>? imageIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel() when $default != null:
return $default(_that.title,_that.description,_that.imageIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(name: 'description_detaille', defaultValue: '')  String description, @JsonKey(name: 'imagesId', defaultValue: [])  List<int>? imageIds)  $default,) {final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel():
return $default(_that.title,_that.description,_that.imageIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'titre', defaultValue: '')  String title, @JsonKey(name: 'description_detaille', defaultValue: '')  String description, @JsonKey(name: 'imagesId', defaultValue: [])  List<int>? imageIds)?  $default,) {final _that = this;
switch (_that) {
case _SendComplaintsSuggestionsInputModel() when $default != null:
return $default(_that.title,_that.description,_that.imageIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendComplaintsSuggestionsInputModel extends SendComplaintsSuggestionsInputModel {
  const _SendComplaintsSuggestionsInputModel({@JsonKey(name: 'titre', defaultValue: '') required this.title, @JsonKey(name: 'description_detaille', defaultValue: '') required this.description, @JsonKey(name: 'imagesId', defaultValue: []) final  List<int>? imageIds}): _imageIds = imageIds,super._();
  factory _SendComplaintsSuggestionsInputModel.fromJson(Map<String, dynamic> json) => _$SendComplaintsSuggestionsInputModelFromJson(json);

@override@JsonKey(name: 'titre', defaultValue: '') final  String title;
@override@JsonKey(name: 'description_detaille', defaultValue: '') final  String description;
 final  List<int>? _imageIds;
@override@JsonKey(name: 'imagesId', defaultValue: []) List<int>? get imageIds {
  final value = _imageIds;
  if (value == null) return null;
  if (_imageIds is EqualUnmodifiableListView) return _imageIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SendComplaintsSuggestionsInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendComplaintsSuggestionsInputModelCopyWith<_SendComplaintsSuggestionsInputModel> get copyWith => __$SendComplaintsSuggestionsInputModelCopyWithImpl<_SendComplaintsSuggestionsInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendComplaintsSuggestionsInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendComplaintsSuggestionsInputModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._imageIds, _imageIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(_imageIds));

@override
String toString() {
  return 'SendComplaintsSuggestionsInputModel(title: $title, description: $description, imageIds: $imageIds)';
}


}

/// @nodoc
abstract mixin class _$SendComplaintsSuggestionsInputModelCopyWith<$Res> implements $SendComplaintsSuggestionsInputModelCopyWith<$Res> {
  factory _$SendComplaintsSuggestionsInputModelCopyWith(_SendComplaintsSuggestionsInputModel value, $Res Function(_SendComplaintsSuggestionsInputModel) _then) = __$SendComplaintsSuggestionsInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'titre', defaultValue: '') String title,@JsonKey(name: 'description_detaille', defaultValue: '') String description,@JsonKey(name: 'imagesId', defaultValue: []) List<int>? imageIds
});




}
/// @nodoc
class __$SendComplaintsSuggestionsInputModelCopyWithImpl<$Res>
    implements _$SendComplaintsSuggestionsInputModelCopyWith<$Res> {
  __$SendComplaintsSuggestionsInputModelCopyWithImpl(this._self, this._then);

  final _SendComplaintsSuggestionsInputModel _self;
  final $Res Function(_SendComplaintsSuggestionsInputModel) _then;

/// Create a copy of SendComplaintsSuggestionsInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? imageIds = freezed,}) {
  return _then(_SendComplaintsSuggestionsInputModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageIds: freezed == imageIds ? _self._imageIds : imageIds // ignore: cast_nullable_to_non_nullable
as List<int>?,
  ));
}


}

// dart format on
