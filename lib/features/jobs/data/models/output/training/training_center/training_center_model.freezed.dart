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

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get name;@JsonKey(name: 'image_path', defaultValue: '') String? get imageUrl;@JsonKey(defaultValue: '') String get description; JobCategoryModel? get category; JobActorModel? get actor; JobLocationModel? get location;@JsonKey(name: 'user') UserModel get user;@JsonKey(name: 'created_at', defaultValue: '') String get createdAt;
/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingCenterModelCopyWith<TrainingCenterModel> get copyWith => _$TrainingCenterModelCopyWithImpl<TrainingCenterModel>(this as TrainingCenterModel, _$identity);

  /// Serializes this TrainingCenterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.location, location) || other.location == location)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,description,category,actor,location,user,createdAt);

@override
String toString() {
  return 'TrainingCenterModel(id: $id, name: $name, imageUrl: $imageUrl, description: $description, category: $category, actor: $actor, location: $location, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainingCenterModelCopyWith<$Res>  {
  factory $TrainingCenterModelCopyWith(TrainingCenterModel value, $Res Function(TrainingCenterModel) _then) = _$TrainingCenterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'image_path', defaultValue: '') String? imageUrl,@JsonKey(defaultValue: '') String description, JobCategoryModel? category, JobActorModel? actor, JobLocationModel? location,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});


$JobCategoryModelCopyWith<$Res>? get category;$JobActorModelCopyWith<$Res>? get actor;$JobLocationModelCopyWith<$Res>? get location;$UserModelCopyWith<$Res> get user;

}
/// @nodoc
class _$TrainingCenterModelCopyWithImpl<$Res>
    implements $TrainingCenterModelCopyWith<$Res> {
  _$TrainingCenterModelCopyWithImpl(this._self, this._then);

  final TrainingCenterModel _self;
  final $Res Function(TrainingCenterModel) _then;

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? description = null,Object? category = freezed,Object? actor = freezed,Object? location = freezed,Object? user = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JobCategoryModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $JobCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobActorModelCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $JobActorModelCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of TrainingCenterModel
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(defaultValue: '')  String description,  JobCategoryModel? category,  JobActorModel? actor,  JobLocationModel? location, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.category,_that.actor,_that.location,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(defaultValue: '')  String description,  JobCategoryModel? category,  JobActorModel? actor,  JobLocationModel? location, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterModel():
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.category,_that.actor,_that.location,_that.user,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String name, @JsonKey(name: 'image_path', defaultValue: '')  String? imageUrl, @JsonKey(defaultValue: '')  String description,  JobCategoryModel? category,  JobActorModel? actor,  JobLocationModel? location, @JsonKey(name: 'user')  UserModel user, @JsonKey(name: 'created_at', defaultValue: '')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingCenterModel() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.description,_that.category,_that.actor,_that.location,_that.user,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingCenterModel extends TrainingCenterModel {
  const _TrainingCenterModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.name, @JsonKey(name: 'image_path', defaultValue: '') this.imageUrl, @JsonKey(defaultValue: '') required this.description, this.category, this.actor, this.location, @JsonKey(name: 'user') required this.user, @JsonKey(name: 'created_at', defaultValue: '') required this.createdAt}): super._();
  factory _TrainingCenterModel.fromJson(Map<String, dynamic> json) => _$TrainingCenterModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String name;
@override@JsonKey(name: 'image_path', defaultValue: '') final  String? imageUrl;
@override@JsonKey(defaultValue: '') final  String description;
@override final  JobCategoryModel? category;
@override final  JobActorModel? actor;
@override final  JobLocationModel? location;
@override@JsonKey(name: 'user') final  UserModel user;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingCenterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.actor, actor) || other.actor == actor)&&(identical(other.location, location) || other.location == location)&&(identical(other.user, user) || other.user == user)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,description,category,actor,location,user,createdAt);

@override
String toString() {
  return 'TrainingCenterModel(id: $id, name: $name, imageUrl: $imageUrl, description: $description, category: $category, actor: $actor, location: $location, user: $user, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingCenterModelCopyWith<$Res> implements $TrainingCenterModelCopyWith<$Res> {
  factory _$TrainingCenterModelCopyWith(_TrainingCenterModel value, $Res Function(_TrainingCenterModel) _then) = __$TrainingCenterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: '') String name,@JsonKey(name: 'image_path', defaultValue: '') String? imageUrl,@JsonKey(defaultValue: '') String description, JobCategoryModel? category, JobActorModel? actor, JobLocationModel? location,@JsonKey(name: 'user') UserModel user,@JsonKey(name: 'created_at', defaultValue: '') String createdAt
});


@override $JobCategoryModelCopyWith<$Res>? get category;@override $JobActorModelCopyWith<$Res>? get actor;@override $JobLocationModelCopyWith<$Res>? get location;@override $UserModelCopyWith<$Res> get user;

}
/// @nodoc
class __$TrainingCenterModelCopyWithImpl<$Res>
    implements _$TrainingCenterModelCopyWith<$Res> {
  __$TrainingCenterModelCopyWithImpl(this._self, this._then);

  final _TrainingCenterModel _self;
  final $Res Function(_TrainingCenterModel) _then;

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? description = null,Object? category = freezed,Object? actor = freezed,Object? location = freezed,Object? user = null,Object? createdAt = null,}) {
  return _then(_TrainingCenterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as JobCategoryModel?,actor: freezed == actor ? _self.actor : actor // ignore: cast_nullable_to_non_nullable
as JobActorModel?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as JobLocationModel?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobCategoryModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $JobCategoryModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of TrainingCenterModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobActorModelCopyWith<$Res>? get actor {
    if (_self.actor == null) {
    return null;
  }

  return $JobActorModelCopyWith<$Res>(_self.actor!, (value) {
    return _then(_self.copyWith(actor: value));
  });
}/// Create a copy of TrainingCenterModel
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
