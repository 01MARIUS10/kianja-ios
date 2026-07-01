// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_expert_executive_input_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateExpertExecutiveInputModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(name: 'firstname', defaultValue: '') String get firstName;@JsonKey(name: 'lastname', defaultValue: '') String get lastName;@JsonKey(name: 'date_of_birth', defaultValue: '') String get dateOfBirth;@JsonKey(defaultValue: '') String get email;@JsonKey(name: 'phone_number', defaultValue: '') String get phoneNumber;@JsonKey(defaultValue: '') String get address;@JsonKey(defaultValue: '') String get biography;@JsonKey(name: 'domain_id', defaultValue: -1) int get domainId;@JsonKey(name: 'cv_pdf_id', defaultValue: -1) int get cvPdfId;
/// Create a copy of UpdateExpertExecutiveInputModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateExpertExecutiveInputModelCopyWith<UpdateExpertExecutiveInputModel> get copyWith => _$UpdateExpertExecutiveInputModelCopyWithImpl<UpdateExpertExecutiveInputModel>(this as UpdateExpertExecutiveInputModel, _$identity);

  /// Serializes this UpdateExpertExecutiveInputModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateExpertExecutiveInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.biography, biography) || other.biography == biography)&&(identical(other.domainId, domainId) || other.domainId == domainId)&&(identical(other.cvPdfId, cvPdfId) || other.cvPdfId == cvPdfId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dateOfBirth,email,phoneNumber,address,biography,domainId,cvPdfId);

@override
String toString() {
  return 'UpdateExpertExecutiveInputModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, phoneNumber: $phoneNumber, address: $address, biography: $biography, domainId: $domainId, cvPdfId: $cvPdfId)';
}


}

/// @nodoc
abstract mixin class $UpdateExpertExecutiveInputModelCopyWith<$Res>  {
  factory $UpdateExpertExecutiveInputModelCopyWith(UpdateExpertExecutiveInputModel value, $Res Function(UpdateExpertExecutiveInputModel) _then) = _$UpdateExpertExecutiveInputModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'firstname', defaultValue: '') String firstName,@JsonKey(name: 'lastname', defaultValue: '') String lastName,@JsonKey(name: 'date_of_birth', defaultValue: '') String dateOfBirth,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,@JsonKey(defaultValue: '') String address,@JsonKey(defaultValue: '') String biography,@JsonKey(name: 'domain_id', defaultValue: -1) int domainId,@JsonKey(name: 'cv_pdf_id', defaultValue: -1) int cvPdfId
});




}
/// @nodoc
class _$UpdateExpertExecutiveInputModelCopyWithImpl<$Res>
    implements $UpdateExpertExecutiveInputModelCopyWith<$Res> {
  _$UpdateExpertExecutiveInputModelCopyWithImpl(this._self, this._then);

  final UpdateExpertExecutiveInputModel _self;
  final $Res Function(UpdateExpertExecutiveInputModel) _then;

/// Create a copy of UpdateExpertExecutiveInputModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? biography = null,Object? domainId = null,Object? cvPdfId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String,domainId: null == domainId ? _self.domainId : domainId // ignore: cast_nullable_to_non_nullable
as int,cvPdfId: null == cvPdfId ? _self.cvPdfId : cvPdfId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateExpertExecutiveInputModel].
extension UpdateExpertExecutiveInputModelPatterns on UpdateExpertExecutiveInputModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateExpertExecutiveInputModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateExpertExecutiveInputModel value)  $default,){
final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateExpertExecutiveInputModel value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography, @JsonKey(name: 'domain_id', defaultValue: -1)  int domainId, @JsonKey(name: 'cv_pdf_id', defaultValue: -1)  int cvPdfId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domainId,_that.cvPdfId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography, @JsonKey(name: 'domain_id', defaultValue: -1)  int domainId, @JsonKey(name: 'cv_pdf_id', defaultValue: -1)  int cvPdfId)  $default,) {final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domainId,_that.cvPdfId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography, @JsonKey(name: 'domain_id', defaultValue: -1)  int domainId, @JsonKey(name: 'cv_pdf_id', defaultValue: -1)  int cvPdfId)?  $default,) {final _that = this;
switch (_that) {
case _UpdateExpertExecutiveInputModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domainId,_that.cvPdfId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateExpertExecutiveInputModel extends UpdateExpertExecutiveInputModel {
  const _UpdateExpertExecutiveInputModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(name: 'firstname', defaultValue: '') required this.firstName, @JsonKey(name: 'lastname', defaultValue: '') required this.lastName, @JsonKey(name: 'date_of_birth', defaultValue: '') required this.dateOfBirth, @JsonKey(defaultValue: '') required this.email, @JsonKey(name: 'phone_number', defaultValue: '') required this.phoneNumber, @JsonKey(defaultValue: '') required this.address, @JsonKey(defaultValue: '') required this.biography, @JsonKey(name: 'domain_id', defaultValue: -1) required this.domainId, @JsonKey(name: 'cv_pdf_id', defaultValue: -1) required this.cvPdfId}): super._();
  factory _UpdateExpertExecutiveInputModel.fromJson(Map<String, dynamic> json) => _$UpdateExpertExecutiveInputModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(name: 'firstname', defaultValue: '') final  String firstName;
@override@JsonKey(name: 'lastname', defaultValue: '') final  String lastName;
@override@JsonKey(name: 'date_of_birth', defaultValue: '') final  String dateOfBirth;
@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(name: 'phone_number', defaultValue: '') final  String phoneNumber;
@override@JsonKey(defaultValue: '') final  String address;
@override@JsonKey(defaultValue: '') final  String biography;
@override@JsonKey(name: 'domain_id', defaultValue: -1) final  int domainId;
@override@JsonKey(name: 'cv_pdf_id', defaultValue: -1) final  int cvPdfId;

/// Create a copy of UpdateExpertExecutiveInputModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateExpertExecutiveInputModelCopyWith<_UpdateExpertExecutiveInputModel> get copyWith => __$UpdateExpertExecutiveInputModelCopyWithImpl<_UpdateExpertExecutiveInputModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateExpertExecutiveInputModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateExpertExecutiveInputModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.biography, biography) || other.biography == biography)&&(identical(other.domainId, domainId) || other.domainId == domainId)&&(identical(other.cvPdfId, cvPdfId) || other.cvPdfId == cvPdfId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dateOfBirth,email,phoneNumber,address,biography,domainId,cvPdfId);

@override
String toString() {
  return 'UpdateExpertExecutiveInputModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, phoneNumber: $phoneNumber, address: $address, biography: $biography, domainId: $domainId, cvPdfId: $cvPdfId)';
}


}

/// @nodoc
abstract mixin class _$UpdateExpertExecutiveInputModelCopyWith<$Res> implements $UpdateExpertExecutiveInputModelCopyWith<$Res> {
  factory _$UpdateExpertExecutiveInputModelCopyWith(_UpdateExpertExecutiveInputModel value, $Res Function(_UpdateExpertExecutiveInputModel) _then) = __$UpdateExpertExecutiveInputModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'firstname', defaultValue: '') String firstName,@JsonKey(name: 'lastname', defaultValue: '') String lastName,@JsonKey(name: 'date_of_birth', defaultValue: '') String dateOfBirth,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,@JsonKey(defaultValue: '') String address,@JsonKey(defaultValue: '') String biography,@JsonKey(name: 'domain_id', defaultValue: -1) int domainId,@JsonKey(name: 'cv_pdf_id', defaultValue: -1) int cvPdfId
});




}
/// @nodoc
class __$UpdateExpertExecutiveInputModelCopyWithImpl<$Res>
    implements _$UpdateExpertExecutiveInputModelCopyWith<$Res> {
  __$UpdateExpertExecutiveInputModelCopyWithImpl(this._self, this._then);

  final _UpdateExpertExecutiveInputModel _self;
  final $Res Function(_UpdateExpertExecutiveInputModel) _then;

/// Create a copy of UpdateExpertExecutiveInputModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? biography = null,Object? domainId = null,Object? cvPdfId = null,}) {
  return _then(_UpdateExpertExecutiveInputModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String,domainId: null == domainId ? _self.domainId : domainId // ignore: cast_nullable_to_non_nullable
as int,cvPdfId: null == cvPdfId ? _self.cvPdfId : cvPdfId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
