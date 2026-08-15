// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signaler_contenu_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignalerContenuInputModel {

@JsonKey(name: 'id', defaultValue: -1) int get contenuId;@JsonKey(name: 'type', defaultValue: '') String get type;@JsonKey(name: 'motif_id', defaultValue: -1) int get motifId;@JsonKey(name: 'commentaire', defaultValue: '') String? get commentaire;
/// Create a copy of SignalerContenuInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignalerContenuInputModelCopyWith<SignalerContenuInputModel> get copyWith => _$SignalerContenuInputModelCopyWithImpl<SignalerContenuInputModel>(this as SignalerContenuInputModel, _$identity);

  /// Serializes this SignalerContenuInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignalerContenuInputModel&&(identical(other.contenuId, contenuId) || other.contenuId == contenuId)&&(identical(other.type, type) || other.type == type)&&(identical(other.motifId, motifId) || other.motifId == motifId)&&(identical(other.commentaire, commentaire) || other.commentaire == commentaire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contenuId,type,motifId,commentaire);

@override
String toString() {
  return 'SignalerContenuInputModel(contenuId: $contenuId, type: $type, motifId: $motifId, commentaire: $commentaire)';
}


}

/// @nodoc
abstract mixin class $SignalerContenuInputModelCopyWith<$Res>  {
  factory $SignalerContenuInputModelCopyWith(SignalerContenuInputModel value, $Res Function(SignalerContenuInputModel) _then) = _$SignalerContenuInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int contenuId,@JsonKey(name: 'type', defaultValue: '') String type,@JsonKey(name: 'motif_id', defaultValue: -1) int motifId,@JsonKey(name: 'commentaire', defaultValue: '') String? commentaire
});




}
/// @nodoc
class _$SignalerContenuInputModelCopyWithImpl<$Res>
    implements $SignalerContenuInputModelCopyWith<$Res> {
  _$SignalerContenuInputModelCopyWithImpl(this._self, this._then);

  final SignalerContenuInputModel _self;
  final $Res Function(SignalerContenuInputModel) _then;

/// Create a copy of SignalerContenuInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contenuId = null,Object? type = null,Object? motifId = null,Object? commentaire = freezed,}) {
  return _then(_self.copyWith(
contenuId: null == contenuId ? _self.contenuId : contenuId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,motifId: null == motifId ? _self.motifId : motifId // ignore: cast_nullable_to_non_nullable
as int,commentaire: freezed == commentaire ? _self.commentaire : commentaire // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignalerContenuInputModel].
extension SignalerContenuInputModelPatterns on SignalerContenuInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignalerContenuInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignalerContenuInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignalerContenuInputModel value)  $default,){
final _that = this;
switch (_that) {
case _SignalerContenuInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignalerContenuInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _SignalerContenuInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int contenuId, @JsonKey(name: 'type', defaultValue: '')  String type, @JsonKey(name: 'motif_id', defaultValue: -1)  int motifId, @JsonKey(name: 'commentaire', defaultValue: '')  String? commentaire)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignalerContenuInputModel() when $default != null:
return $default(_that.contenuId,_that.type,_that.motifId,_that.commentaire);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int contenuId, @JsonKey(name: 'type', defaultValue: '')  String type, @JsonKey(name: 'motif_id', defaultValue: -1)  int motifId, @JsonKey(name: 'commentaire', defaultValue: '')  String? commentaire)  $default,) {final _that = this;
switch (_that) {
case _SignalerContenuInputModel():
return $default(_that.contenuId,_that.type,_that.motifId,_that.commentaire);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int contenuId, @JsonKey(name: 'type', defaultValue: '')  String type, @JsonKey(name: 'motif_id', defaultValue: -1)  int motifId, @JsonKey(name: 'commentaire', defaultValue: '')  String? commentaire)?  $default,) {final _that = this;
switch (_that) {
case _SignalerContenuInputModel() when $default != null:
return $default(_that.contenuId,_that.type,_that.motifId,_that.commentaire);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignalerContenuInputModel extends SignalerContenuInputModel {
  const _SignalerContenuInputModel({@JsonKey(name: 'id', defaultValue: -1) required this.contenuId, @JsonKey(name: 'type', defaultValue: '') required this.type, @JsonKey(name: 'motif_id', defaultValue: -1) required this.motifId, @JsonKey(name: 'commentaire', defaultValue: '') this.commentaire}): super._();
  factory _SignalerContenuInputModel.fromJson(Map<String, dynamic> json) => _$SignalerContenuInputModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int contenuId;
@override@JsonKey(name: 'type', defaultValue: '') final  String type;
@override@JsonKey(name: 'motif_id', defaultValue: -1) final  int motifId;
@override@JsonKey(name: 'commentaire', defaultValue: '') final  String? commentaire;

/// Create a copy of SignalerContenuInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignalerContenuInputModelCopyWith<_SignalerContenuInputModel> get copyWith => __$SignalerContenuInputModelCopyWithImpl<_SignalerContenuInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignalerContenuInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignalerContenuInputModel&&(identical(other.contenuId, contenuId) || other.contenuId == contenuId)&&(identical(other.type, type) || other.type == type)&&(identical(other.motifId, motifId) || other.motifId == motifId)&&(identical(other.commentaire, commentaire) || other.commentaire == commentaire));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contenuId,type,motifId,commentaire);

@override
String toString() {
  return 'SignalerContenuInputModel(contenuId: $contenuId, type: $type, motifId: $motifId, commentaire: $commentaire)';
}


}

/// @nodoc
abstract mixin class _$SignalerContenuInputModelCopyWith<$Res> implements $SignalerContenuInputModelCopyWith<$Res> {
  factory _$SignalerContenuInputModelCopyWith(_SignalerContenuInputModel value, $Res Function(_SignalerContenuInputModel) _then) = __$SignalerContenuInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int contenuId,@JsonKey(name: 'type', defaultValue: '') String type,@JsonKey(name: 'motif_id', defaultValue: -1) int motifId,@JsonKey(name: 'commentaire', defaultValue: '') String? commentaire
});




}
/// @nodoc
class __$SignalerContenuInputModelCopyWithImpl<$Res>
    implements _$SignalerContenuInputModelCopyWith<$Res> {
  __$SignalerContenuInputModelCopyWithImpl(this._self, this._then);

  final _SignalerContenuInputModel _self;
  final $Res Function(_SignalerContenuInputModel) _then;

/// Create a copy of SignalerContenuInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contenuId = null,Object? type = null,Object? motifId = null,Object? commentaire = freezed,}) {
  return _then(_SignalerContenuInputModel(
contenuId: null == contenuId ? _self.contenuId : contenuId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,motifId: null == motifId ? _self.motifId : motifId // ignore: cast_nullable_to_non_nullable
as int,commentaire: freezed == commentaire ? _self.commentaire : commentaire // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
