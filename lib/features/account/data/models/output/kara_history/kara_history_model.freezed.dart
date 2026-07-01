// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kara_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KaraHistoryModel {

@JsonKey(name: 'id', defaultValue: -1) int get id;@JsonKey(defaultValue: '') String get type;@JsonKey(defaultValue: '') String get message;@JsonKey(defaultValue: 0) int get montant;@JsonKey(name: 'is_income', defaultValue: false) bool get isIncome;@JsonKey(name: 'created_at', defaultValue: '') String get date;
/// Create a copy of KaraHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KaraHistoryModelCopyWith<KaraHistoryModel> get copyWith => _$KaraHistoryModelCopyWithImpl<KaraHistoryModel>(this as KaraHistoryModel, _$identity);

  /// Serializes this KaraHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KaraHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,message,montant,isIncome,date);

@override
String toString() {
  return 'KaraHistoryModel(id: $id, type: $type, message: $message, montant: $montant, isIncome: $isIncome, date: $date)';
}


}

/// @nodoc
abstract mixin class $KaraHistoryModelCopyWith<$Res>  {
  factory $KaraHistoryModelCopyWith(KaraHistoryModel value, $Res Function(KaraHistoryModel) _then) = _$KaraHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String message,@JsonKey(defaultValue: 0) int montant,@JsonKey(name: 'is_income', defaultValue: false) bool isIncome,@JsonKey(name: 'created_at', defaultValue: '') String date
});




}
/// @nodoc
class _$KaraHistoryModelCopyWithImpl<$Res>
    implements $KaraHistoryModelCopyWith<$Res> {
  _$KaraHistoryModelCopyWithImpl(this._self, this._then);

  final KaraHistoryModel _self;
  final $Res Function(KaraHistoryModel) _then;

/// Create a copy of KaraHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? message = null,Object? montant = null,Object? isIncome = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as int,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [KaraHistoryModel].
extension KaraHistoryModelPatterns on KaraHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KaraHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KaraHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KaraHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _KaraHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KaraHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _KaraHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String message, @JsonKey(defaultValue: 0)  int montant, @JsonKey(name: 'is_income', defaultValue: false)  bool isIncome, @JsonKey(name: 'created_at', defaultValue: '')  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KaraHistoryModel() when $default != null:
return $default(_that.id,_that.type,_that.message,_that.montant,_that.isIncome,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String message, @JsonKey(defaultValue: 0)  int montant, @JsonKey(name: 'is_income', defaultValue: false)  bool isIncome, @JsonKey(name: 'created_at', defaultValue: '')  String date)  $default,) {final _that = this;
switch (_that) {
case _KaraHistoryModel():
return $default(_that.id,_that.type,_that.message,_that.montant,_that.isIncome,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id', defaultValue: -1)  int id, @JsonKey(defaultValue: '')  String type, @JsonKey(defaultValue: '')  String message, @JsonKey(defaultValue: 0)  int montant, @JsonKey(name: 'is_income', defaultValue: false)  bool isIncome, @JsonKey(name: 'created_at', defaultValue: '')  String date)?  $default,) {final _that = this;
switch (_that) {
case _KaraHistoryModel() when $default != null:
return $default(_that.id,_that.type,_that.message,_that.montant,_that.isIncome,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KaraHistoryModel extends KaraHistoryModel {
  const _KaraHistoryModel({@JsonKey(name: 'id', defaultValue: -1) required this.id, @JsonKey(defaultValue: '') required this.type, @JsonKey(defaultValue: '') required this.message, @JsonKey(defaultValue: 0) required this.montant, @JsonKey(name: 'is_income', defaultValue: false) required this.isIncome, @JsonKey(name: 'created_at', defaultValue: '') required this.date}): super._();
  factory _KaraHistoryModel.fromJson(Map<String, dynamic> json) => _$KaraHistoryModelFromJson(json);

@override@JsonKey(name: 'id', defaultValue: -1) final  int id;
@override@JsonKey(defaultValue: '') final  String type;
@override@JsonKey(defaultValue: '') final  String message;
@override@JsonKey(defaultValue: 0) final  int montant;
@override@JsonKey(name: 'is_income', defaultValue: false) final  bool isIncome;
@override@JsonKey(name: 'created_at', defaultValue: '') final  String date;

/// Create a copy of KaraHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KaraHistoryModelCopyWith<_KaraHistoryModel> get copyWith => __$KaraHistoryModelCopyWithImpl<_KaraHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KaraHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KaraHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.message, message) || other.message == message)&&(identical(other.montant, montant) || other.montant == montant)&&(identical(other.isIncome, isIncome) || other.isIncome == isIncome)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,message,montant,isIncome,date);

@override
String toString() {
  return 'KaraHistoryModel(id: $id, type: $type, message: $message, montant: $montant, isIncome: $isIncome, date: $date)';
}


}

/// @nodoc
abstract mixin class _$KaraHistoryModelCopyWith<$Res> implements $KaraHistoryModelCopyWith<$Res> {
  factory _$KaraHistoryModelCopyWith(_KaraHistoryModel value, $Res Function(_KaraHistoryModel) _then) = __$KaraHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id', defaultValue: -1) int id,@JsonKey(defaultValue: '') String type,@JsonKey(defaultValue: '') String message,@JsonKey(defaultValue: 0) int montant,@JsonKey(name: 'is_income', defaultValue: false) bool isIncome,@JsonKey(name: 'created_at', defaultValue: '') String date
});




}
/// @nodoc
class __$KaraHistoryModelCopyWithImpl<$Res>
    implements _$KaraHistoryModelCopyWith<$Res> {
  __$KaraHistoryModelCopyWithImpl(this._self, this._then);

  final _KaraHistoryModel _self;
  final $Res Function(_KaraHistoryModel) _then;

/// Create a copy of KaraHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? message = null,Object? montant = null,Object? isIncome = null,Object? date = null,}) {
  return _then(_KaraHistoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,montant: null == montant ? _self.montant : montant // ignore: cast_nullable_to_non_nullable
as int,isIncome: null == isIncome ? _self.isIncome : isIncome // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
