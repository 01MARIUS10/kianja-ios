// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prolonger_job_applicant_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProlongerJobApplicantInputModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(defaultValue: -1) int get typeId;@JsonKey(defaultValue: -1) int get durationId;
/// Create a copy of ProlongerJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProlongerJobApplicantInputModelCopyWith<ProlongerJobApplicantInputModel> get copyWith => _$ProlongerJobApplicantInputModelCopyWithImpl<ProlongerJobApplicantInputModel>(this as ProlongerJobApplicantInputModel, _$identity);

  /// Serializes this ProlongerJobApplicantInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProlongerJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,typeId,durationId);

@override
String toString() {
  return 'ProlongerJobApplicantInputModel(id: $id, typeId: $typeId, durationId: $durationId)';
}


}

/// @nodoc
abstract mixin class $ProlongerJobApplicantInputModelCopyWith<$Res>  {
  factory $ProlongerJobApplicantInputModelCopyWith(ProlongerJobApplicantInputModel value, $Res Function(ProlongerJobApplicantInputModel) _then) = _$ProlongerJobApplicantInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId
});




}
/// @nodoc
class _$ProlongerJobApplicantInputModelCopyWithImpl<$Res>
    implements $ProlongerJobApplicantInputModelCopyWith<$Res> {
  _$ProlongerJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final ProlongerJobApplicantInputModel _self;
  final $Res Function(ProlongerJobApplicantInputModel) _then;

/// Create a copy of ProlongerJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? typeId = null,Object? durationId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProlongerJobApplicantInputModel].
extension ProlongerJobApplicantInputModelPatterns on ProlongerJobApplicantInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProlongerJobApplicantInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProlongerJobApplicantInputModel value)  $default,){
final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProlongerJobApplicantInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.typeId,_that.durationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId)  $default,) {final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel():
return $default(_that.id,_that.typeId,_that.durationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(defaultValue: -1)  int typeId, @JsonKey(defaultValue: -1)  int durationId)?  $default,) {final _that = this;
switch (_that) {
case _ProlongerJobApplicantInputModel() when $default != null:
return $default(_that.id,_that.typeId,_that.durationId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProlongerJobApplicantInputModel extends ProlongerJobApplicantInputModel {
  const _ProlongerJobApplicantInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(defaultValue: -1) required this.typeId, @JsonKey(defaultValue: -1) required this.durationId}): super._();
  factory _ProlongerJobApplicantInputModel.fromJson(Map<String, dynamic> json) => _$ProlongerJobApplicantInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: -1) final  int typeId;
@override@JsonKey(defaultValue: -1) final  int durationId;

/// Create a copy of ProlongerJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProlongerJobApplicantInputModelCopyWith<_ProlongerJobApplicantInputModel> get copyWith => __$ProlongerJobApplicantInputModelCopyWithImpl<_ProlongerJobApplicantInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProlongerJobApplicantInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProlongerJobApplicantInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.typeId, typeId) || other.typeId == typeId)&&(identical(other.durationId, durationId) || other.durationId == durationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,typeId,durationId);

@override
String toString() {
  return 'ProlongerJobApplicantInputModel(id: $id, typeId: $typeId, durationId: $durationId)';
}


}

/// @nodoc
abstract mixin class _$ProlongerJobApplicantInputModelCopyWith<$Res> implements $ProlongerJobApplicantInputModelCopyWith<$Res> {
  factory _$ProlongerJobApplicantInputModelCopyWith(_ProlongerJobApplicantInputModel value, $Res Function(_ProlongerJobApplicantInputModel) _then) = __$ProlongerJobApplicantInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(defaultValue: -1) int typeId,@JsonKey(defaultValue: -1) int durationId
});




}
/// @nodoc
class __$ProlongerJobApplicantInputModelCopyWithImpl<$Res>
    implements _$ProlongerJobApplicantInputModelCopyWith<$Res> {
  __$ProlongerJobApplicantInputModelCopyWithImpl(this._self, this._then);

  final _ProlongerJobApplicantInputModel _self;
  final $Res Function(_ProlongerJobApplicantInputModel) _then;

/// Create a copy of ProlongerJobApplicantInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? typeId = null,Object? durationId = null,}) {
  return _then(_ProlongerJobApplicantInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,typeId: null == typeId ? _self.typeId : typeId // ignore: cast_nullable_to_non_nullable
as int,durationId: null == durationId ? _self.durationId : durationId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
