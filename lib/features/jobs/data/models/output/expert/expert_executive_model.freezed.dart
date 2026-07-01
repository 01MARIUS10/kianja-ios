// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expert_executive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpertExecutiveModel {

@JsonKey(defaultValue: -1) int get id;@JsonKey(name: 'firstname', defaultValue: '') String get firstName;@JsonKey(name: 'lastname', defaultValue: '') String get lastName;@JsonKey(name: 'date_of_birth', defaultValue: '') String get dateOfBirth;@JsonKey(defaultValue: '') String get email;@JsonKey(name: 'phone_number', defaultValue: '') String get phoneNumber;@JsonKey(defaultValue: '') String get address;@JsonKey(defaultValue: '') String get biography; JobDomainModel get domain;@JsonKey(name: 'cv_pdf_url', defaultValue: '') String get pdfUrl;
/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpertExecutiveModelCopyWith<ExpertExecutiveModel> get copyWith => _$ExpertExecutiveModelCopyWithImpl<ExpertExecutiveModel>(this as ExpertExecutiveModel, _$identity);

  /// Serializes this ExpertExecutiveModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpertExecutiveModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.biography, biography) || other.biography == biography)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dateOfBirth,email,phoneNumber,address,biography,domain,pdfUrl);

@override
String toString() {
  return 'ExpertExecutiveModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, phoneNumber: $phoneNumber, address: $address, biography: $biography, domain: $domain, pdfUrl: $pdfUrl)';
}


}

/// @nodoc
abstract mixin class $ExpertExecutiveModelCopyWith<$Res>  {
  factory $ExpertExecutiveModelCopyWith(ExpertExecutiveModel value, $Res Function(ExpertExecutiveModel) _then) = _$ExpertExecutiveModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'firstname', defaultValue: '') String firstName,@JsonKey(name: 'lastname', defaultValue: '') String lastName,@JsonKey(name: 'date_of_birth', defaultValue: '') String dateOfBirth,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,@JsonKey(defaultValue: '') String address,@JsonKey(defaultValue: '') String biography, JobDomainModel domain,@JsonKey(name: 'cv_pdf_url', defaultValue: '') String pdfUrl
});


$JobDomainModelCopyWith<$Res> get domain;

}
/// @nodoc
class _$ExpertExecutiveModelCopyWithImpl<$Res>
    implements $ExpertExecutiveModelCopyWith<$Res> {
  _$ExpertExecutiveModelCopyWithImpl(this._self, this._then);

  final ExpertExecutiveModel _self;
  final $Res Function(ExpertExecutiveModel) _then;

/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? biography = null,Object? domain = null,Object? pdfUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as JobDomainModel,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDomainModelCopyWith<$Res> get domain {
  
  return $JobDomainModelCopyWith<$Res>(_self.domain, (value) {
    return _then(_self.copyWith(domain: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExpertExecutiveModel].
extension ExpertExecutiveModelPatterns on ExpertExecutiveModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpertExecutiveModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpertExecutiveModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpertExecutiveModel value)  $default,){
final _that = this;
switch (_that) {
case _ExpertExecutiveModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpertExecutiveModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExpertExecutiveModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography,  JobDomainModel domain, @JsonKey(name: 'cv_pdf_url', defaultValue: '')  String pdfUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpertExecutiveModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domain,_that.pdfUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography,  JobDomainModel domain, @JsonKey(name: 'cv_pdf_url', defaultValue: '')  String pdfUrl)  $default,) {final _that = this;
switch (_that) {
case _ExpertExecutiveModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domain,_that.pdfUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(defaultValue: -1)  int id, @JsonKey(name: 'firstname', defaultValue: '')  String firstName, @JsonKey(name: 'lastname', defaultValue: '')  String lastName, @JsonKey(name: 'date_of_birth', defaultValue: '')  String dateOfBirth, @JsonKey(defaultValue: '')  String email, @JsonKey(name: 'phone_number', defaultValue: '')  String phoneNumber, @JsonKey(defaultValue: '')  String address, @JsonKey(defaultValue: '')  String biography,  JobDomainModel domain, @JsonKey(name: 'cv_pdf_url', defaultValue: '')  String pdfUrl)?  $default,) {final _that = this;
switch (_that) {
case _ExpertExecutiveModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.dateOfBirth,_that.email,_that.phoneNumber,_that.address,_that.biography,_that.domain,_that.pdfUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpertExecutiveModel extends ExpertExecutiveModel {
  const _ExpertExecutiveModel({@JsonKey(defaultValue: -1) required this.id, @JsonKey(name: 'firstname', defaultValue: '') required this.firstName, @JsonKey(name: 'lastname', defaultValue: '') required this.lastName, @JsonKey(name: 'date_of_birth', defaultValue: '') required this.dateOfBirth, @JsonKey(defaultValue: '') required this.email, @JsonKey(name: 'phone_number', defaultValue: '') required this.phoneNumber, @JsonKey(defaultValue: '') required this.address, @JsonKey(defaultValue: '') required this.biography, required this.domain, @JsonKey(name: 'cv_pdf_url', defaultValue: '') required this.pdfUrl}): super._();
  factory _ExpertExecutiveModel.fromJson(Map<String, dynamic> json) => _$ExpertExecutiveModelFromJson(json);

@override@JsonKey(defaultValue: -1) final  int id;
@override@JsonKey(name: 'firstname', defaultValue: '') final  String firstName;
@override@JsonKey(name: 'lastname', defaultValue: '') final  String lastName;
@override@JsonKey(name: 'date_of_birth', defaultValue: '') final  String dateOfBirth;
@override@JsonKey(defaultValue: '') final  String email;
@override@JsonKey(name: 'phone_number', defaultValue: '') final  String phoneNumber;
@override@JsonKey(defaultValue: '') final  String address;
@override@JsonKey(defaultValue: '') final  String biography;
@override final  JobDomainModel domain;
@override@JsonKey(name: 'cv_pdf_url', defaultValue: '') final  String pdfUrl;

/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpertExecutiveModelCopyWith<_ExpertExecutiveModel> get copyWith => __$ExpertExecutiveModelCopyWithImpl<_ExpertExecutiveModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpertExecutiveModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpertExecutiveModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.address, address) || other.address == address)&&(identical(other.biography, biography) || other.biography == biography)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,dateOfBirth,email,phoneNumber,address,biography,domain,pdfUrl);

@override
String toString() {
  return 'ExpertExecutiveModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, email: $email, phoneNumber: $phoneNumber, address: $address, biography: $biography, domain: $domain, pdfUrl: $pdfUrl)';
}


}

/// @nodoc
abstract mixin class _$ExpertExecutiveModelCopyWith<$Res> implements $ExpertExecutiveModelCopyWith<$Res> {
  factory _$ExpertExecutiveModelCopyWith(_ExpertExecutiveModel value, $Res Function(_ExpertExecutiveModel) _then) = __$ExpertExecutiveModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(defaultValue: -1) int id,@JsonKey(name: 'firstname', defaultValue: '') String firstName,@JsonKey(name: 'lastname', defaultValue: '') String lastName,@JsonKey(name: 'date_of_birth', defaultValue: '') String dateOfBirth,@JsonKey(defaultValue: '') String email,@JsonKey(name: 'phone_number', defaultValue: '') String phoneNumber,@JsonKey(defaultValue: '') String address,@JsonKey(defaultValue: '') String biography, JobDomainModel domain,@JsonKey(name: 'cv_pdf_url', defaultValue: '') String pdfUrl
});


@override $JobDomainModelCopyWith<$Res> get domain;

}
/// @nodoc
class __$ExpertExecutiveModelCopyWithImpl<$Res>
    implements _$ExpertExecutiveModelCopyWith<$Res> {
  __$ExpertExecutiveModelCopyWithImpl(this._self, this._then);

  final _ExpertExecutiveModel _self;
  final $Res Function(_ExpertExecutiveModel) _then;

/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? dateOfBirth = null,Object? email = null,Object? phoneNumber = null,Object? address = null,Object? biography = null,Object? domain = null,Object? pdfUrl = null,}) {
  return _then(_ExpertExecutiveModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: null == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,biography: null == biography ? _self.biography : biography // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as JobDomainModel,pdfUrl: null == pdfUrl ? _self.pdfUrl : pdfUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ExpertExecutiveModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobDomainModelCopyWith<$Res> get domain {
  
  return $JobDomainModelCopyWith<$Res>(_self.domain, (value) {
    return _then(_self.copyWith(domain: value));
  });
}
}

// dart format on
