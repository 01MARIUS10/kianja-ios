// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hot_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HotEventModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get title;@JsonKey(defaultValue: '') String get description;@JsonKey(name: 'start_date', defaultValue: '') String get startDate;@JsonKey(name: 'end_date', defaultValue: '') String get endDate;@JsonKey(defaultValue: '') String get type;@JsonKey(defaultValue: '') String get imageUrl; JobImageModel? get image;@JsonKey(name: 'training_center') TrainingCenterModel get center;@JsonKey(defaultValue: false) bool get isFavorite;
/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HotEventModelCopyWith<HotEventModel> get copyWith => _$HotEventModelCopyWithImpl<HotEventModel>(this as HotEventModel, _$identity);

  /// Serializes this HotEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HotEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.image, image) || other.image == image)&&(identical(other.center, center) || other.center == center)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,endDate,type,imageUrl,image,center,isFavorite);

@override
String toString() {
  return 'HotEventModel(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, type: $type, imageUrl: $imageUrl, image: $image, center: $center, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $HotEventModelCopyWith<$Res>  {
  factory $HotEventModelCopyWith(HotEventModel value, $Res Function(HotEventModel) _then) = _$HotEventModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'start_date', defaultValue: '') String startDate,@JsonKey(name: 'end_date', defaultValue: '') String endDate,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String imageUrl, JobImageModel? image,@JsonKey(name: 'training_center') TrainingCenterModel center,@JsonKey(defaultValue: false) bool isFavorite
});


$JobImageModelCopyWith<$Res>? get image;$TrainingCenterModelCopyWith<$Res> get center;

}
/// @nodoc
class _$HotEventModelCopyWithImpl<$Res>
    implements $HotEventModelCopyWith<$Res> {
  _$HotEventModelCopyWithImpl(this._self, this._then);

  final HotEventModel _self;
  final $Res Function(HotEventModel) _then;

/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? type = null,Object? imageUrl = null,Object? image = freezed,Object? center = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as JobImageModel?,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as TrainingCenterModel,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $JobImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCenterModelCopyWith<$Res> get center {
  
  return $TrainingCenterModelCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}


/// Adds pattern-matching-related methods to [HotEventModel].
extension HotEventModelPatterns on HotEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HotEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HotEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HotEventModel value)  $default,){
final _that = this;
switch (_that) {
case _HotEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HotEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _HotEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String imageUrl,  JobImageModel? image, @JsonKey(name: 'training_center')  TrainingCenterModel center, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HotEventModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.type,_that.imageUrl,_that.image,_that.center,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String imageUrl,  JobImageModel? image, @JsonKey(name: 'training_center')  TrainingCenterModel center, @JsonKey(defaultValue: false)  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _HotEventModel():
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.type,_that.imageUrl,_that.image,_that.center,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String title, @JsonKey(defaultValue: '')  String description, @JsonKey(name: 'start_date', defaultValue: '')  String startDate, @JsonKey(name: 'end_date', defaultValue: '')  String endDate, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String imageUrl,  JobImageModel? image, @JsonKey(name: 'training_center')  TrainingCenterModel center, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _HotEventModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startDate,_that.endDate,_that.type,_that.imageUrl,_that.image,_that.center,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HotEventModel extends HotEventModel {
  const _HotEventModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.title, @JsonKey(defaultValue: '') required this.description, @JsonKey(name: 'start_date', defaultValue: '') required this.startDate, @JsonKey(name: 'end_date', defaultValue: '') required this.endDate, @JsonKey(defaultValue: '') required this.type, @JsonKey(defaultValue: '') required this.imageUrl, this.image, @JsonKey(name: 'training_center') required this.center, @JsonKey(defaultValue: false) required this.isFavorite}): super._();
  factory _HotEventModel.fromJson(Map<String, dynamic> json) => _$HotEventModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String title;
@override@JsonKey(defaultValue: '') final  String description;
@override@JsonKey(name: 'start_date', defaultValue: '') final  String startDate;
@override@JsonKey(name: 'end_date', defaultValue: '') final  String endDate;
@override@JsonKey(defaultValue: '') final  String type;
@override@JsonKey(defaultValue: '') final  String imageUrl;
@override final  JobImageModel? image;
@override@JsonKey(name: 'training_center') final  TrainingCenterModel center;
@override@JsonKey(defaultValue: false) final  bool isFavorite;

/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HotEventModelCopyWith<_HotEventModel> get copyWith => __$HotEventModelCopyWithImpl<_HotEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HotEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HotEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.image, image) || other.image == image)&&(identical(other.center, center) || other.center == center)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startDate,endDate,type,imageUrl,image,center,isFavorite);

@override
String toString() {
  return 'HotEventModel(id: $id, title: $title, description: $description, startDate: $startDate, endDate: $endDate, type: $type, imageUrl: $imageUrl, image: $image, center: $center, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$HotEventModelCopyWith<$Res> implements $HotEventModelCopyWith<$Res> {
  factory _$HotEventModelCopyWith(_HotEventModel value, $Res Function(_HotEventModel) _then) = __$HotEventModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String title,@JsonKey(defaultValue: '') String description,@JsonKey(name: 'start_date', defaultValue: '') String startDate,@JsonKey(name: 'end_date', defaultValue: '') String endDate,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String imageUrl, JobImageModel? image,@JsonKey(name: 'training_center') TrainingCenterModel center,@JsonKey(defaultValue: false) bool isFavorite
});


@override $JobImageModelCopyWith<$Res>? get image;@override $TrainingCenterModelCopyWith<$Res> get center;

}
/// @nodoc
class __$HotEventModelCopyWithImpl<$Res>
    implements _$HotEventModelCopyWith<$Res> {
  __$HotEventModelCopyWithImpl(this._self, this._then);

  final _HotEventModel _self;
  final $Res Function(_HotEventModel) _then;

/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startDate = null,Object? endDate = null,Object? type = null,Object? imageUrl = null,Object? image = freezed,Object? center = null,Object? isFavorite = null,}) {
  return _then(_HotEventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as JobImageModel?,center: null == center ? _self.center : center // ignore: cast_nullable_to_non_nullable
as TrainingCenterModel,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobImageModelCopyWith<$Res>? get image {
    if (_self.image == null) {
    return null;
  }

  return $JobImageModelCopyWith<$Res>(_self.image!, (value) {
    return _then(_self.copyWith(image: value));
  });
}/// Create a copy of HotEventModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainingCenterModelCopyWith<$Res> get center {
  
  return $TrainingCenterModelCopyWith<$Res>(_self.center, (value) {
    return _then(_self.copyWith(center: value));
  });
}
}

// dart format on
