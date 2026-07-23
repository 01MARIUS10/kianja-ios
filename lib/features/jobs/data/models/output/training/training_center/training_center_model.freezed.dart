// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'training_center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingCenterModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'image_path', defaultValue: '') String? get imageUrl;@JsonKey(name: 'images') List<JobImageModel>? get images;@JsonKey(defaultValue: '') String get description; List<JobDomainModel>? get domains; JobLocationModel? get location; TrainingCenterBadge? get badge;@JsonKey(name: 'user') UserModel get user;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt;@JsonKey(defaultValue: false) bool get isFavorite;
/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCenterModelCopyWith<TrainingCenterModel> get copyWith => _$TrainingCenterModelCopyWithImpl<TrainingCenterModel>(this as TrainingCenterModel, _$identity);

  /// Serializes this TrainingCenterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.domains, domains)&&(identical(other.location, location) || other.location == location)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(images),description,const DeepCollectionEquality().hash(domains),location,badge,user,createdAt,isFavorite);

@override
String toString() {
  return 'TrainingCenterModel(id: $id, name: $name, imageUrl: $imageUrl, images: $images, description: $description, domains: $domains, location: $location, badge: $badge, user: $user, createdAt: $createdAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class $TrainingCenterModelCopyWith<$Res>  {
  factory $TrainingCenterModelCopyWith(TrainingCenterModel value, $Res Function(TrainingCenterModel) _then) = _$TrainingCenterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'image_path', defaultValue: '') String? imageUrl,@JsonKey(name: 'images') List<JobImageModel>? images,@JsonKey(defaultValue: '') String description, List<JobDomainModel>? domains, JobLocationModel? location, TrainingCenterBadge? badge,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt,@JsonKey(defaultValue: false) bool isFavorite
});


$JobLocationModelCopyWith<$Res>? get location;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$TrainingCenterModelCopyWithImpl<$Res>
    implements $TrainingCenterModelCopyWith<$Res> {
  _$TrainingCenterModelCopyWithImpl(this._self, this._then);

  final TrainingCenterModel _self;
  final $Res Function(TrainingCenterModel) _then;

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? images = freezed,Object? description = null,Object? domains = freezed,Object? location = freezed,Object? badge = freezed,Object? user = null,Object? createdAt = null,Object? isFavorite = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,domains: freezed == domains ? _self.domains : domains // ignore: cast_nullable_to_non_nullable
as List<JobDomainModel>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as TrainingCenterBadge?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $JobLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainingCenterModel].
extension TrainingCenterModelPatterns on TrainingCenterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingCenterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingCenterModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingCenterModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(name: 'images')  List<JobImageModel>? images, @JsonKey(defaultValue: '')  String description,  List<JobDomainModel>? domains,  JobLocationModel? location,  TrainingCenterBadge? badge, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.images,_that.description,_that.domains,_that.location,_that.badge,_that.user,_that.createdAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(name: 'images')  List<JobImageModel>? images, @JsonKey(defaultValue: '')  String description,  List<JobDomainModel>? domains,  JobLocationModel? location,  TrainingCenterBadge? badge, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite)  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.images,_that.description,_that.domains,_that.location,_that.badge,_that.user,_that.createdAt,_that.isFavorite);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(name: 'images')  List<JobImageModel>? images, @JsonKey(defaultValue: '')  String description,  List<JobDomainModel>? domains,  JobLocationModel? location,  TrainingCenterBadge? badge, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt, @JsonKey(defaultValue: false)  bool isFavorite)?  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.images,_that.description,_that.domains,_that.location,_that.badge,_that.user,_that.createdAt,_that.isFavorite);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingCenterModel extends TrainingCenterModel {
  const _TrainingCenterModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'image_path', defaultValue: '') this.imageUrl, @JsonKey(name: 'images') final  List<JobImageModel>? images, @JsonKey(defaultValue: '') required this.description, final  List<JobDomainModel>? domains, this.location, this.badge, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt, @JsonKey(defaultValue: false) required this.isFavorite}): _images = images,_domains = domains,super._();
  factory _TrainingCenterModel.fromJson(Map<String, dynamic> json) => _$TrainingCenterModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(name: 'image_path', defaultValue: '') final  String? imageUrl;
 final  List<JobImageModel>? _images;
@override@JsonKey(name: 'images') List<JobImageModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(defaultValue: '') final  String description;
 final  List<JobDomainModel>? _domains;
@override List<JobDomainModel>? get domains {
  final value = _domains;
  if (value == null) return null;
  if (_domains is EqualUnmodifiableListView) return _domains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  JobLocationModel? location;
@override final  TrainingCenterBadge? badge;
@override@JsonKey(name: 'user') final  UserModel user;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;
@override@JsonKey(defaultValue: false) final  bool isFavorite;

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingCenterModelCopyWith<_TrainingCenterModel> get copyWith => __$TrainingCenterModelCopyWithImpl<_TrainingCenterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingCenterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._domains, _domains)&&(identical(other.location, location) || other.location == location)&&(identical(other.badge, badge) || other.badge == badge)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,const DeepCollectionEquality().hash(_images),description,const DeepCollectionEquality().hash(_domains),location,badge,user,createdAt,isFavorite);

@override
String toString() {
  return 'TrainingCenterModel(id: $id, name: $name, imageUrl: $imageUrl, images: $images, description: $description, domains: $domains, location: $location, badge: $badge, user: $user, createdAt: $createdAt, isFavorite: $isFavorite)';
}


}

/// @nodoc
abstract mixin class _$TrainingCenterModelCopyWith<$Res> implements $TrainingCenterModelCopyWith<$Res> {
  factory _$TrainingCenterModelCopyWith(_TrainingCenterModel value, $Res Function(_TrainingCenterModel) _then) = __$TrainingCenterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'image_path', defaultValue: '') String? imageUrl,@JsonKey(name: 'images') List<JobImageModel>? images,@JsonKey(defaultValue: '') String description, List<JobDomainModel>? domains, JobLocationModel? location, TrainingCenterBadge? badge,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt,@JsonKey(defaultValue: false) bool isFavorite
});


@override $JobLocationModelCopyWith<$Res>? get location;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$TrainingCenterModelCopyWithImpl<$Res>
    implements _$TrainingCenterModelCopyWith<$Res> {
  __$TrainingCenterModelCopyWithImpl(this._self, this._then);

  final _TrainingCenterModel _self;
  final $Res Function(_TrainingCenterModel) _then;

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? images = freezed,Object? description = null,Object? domains = freezed,Object? location = freezed,Object? badge = freezed,Object? user = null,Object? createdAt = null,Object? isFavorite = null,}) {
  return _then(_TrainingCenterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<JobImageModel>?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,domains: freezed == domains ? _self._domains : domains // ignore: cast_nullable_to_non_nullable
as List<JobDomainModel>?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,badge: freezed == badge ? _self.badge : badge // ignore: cast_nullable_to_non_nullable
as TrainingCenterBadge?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobLocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $JobLocationModelCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
