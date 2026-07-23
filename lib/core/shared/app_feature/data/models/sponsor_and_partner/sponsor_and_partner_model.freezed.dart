// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sponsor_and_partner_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SponsorAndPartnerModel {

@JsonKey(name: 'sponsor') SponsorModel? get sponsor;@JsonKey(name: 'partenaire') PartnerModel? get partner;
/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SponsorAndPartnerModelCopyWith<SponsorAndPartnerModel> get copyWith => _$SponsorAndPartnerModelCopyWithImpl<SponsorAndPartnerModel>(this as SponsorAndPartnerModel, _$identity);

  /// Serializes this SponsorAndPartnerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SponsorAndPartnerModel&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.partner, partner) || other.partner == partner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,partner);

@override
String toString() {
  return 'SponsorAndPartnerModel(sponsor: $sponsor, partner: $partner)';
}


}

/// @nodoc
abstract mixin class $SponsorAndPartnerModelCopyWith<$Res>  {
  factory $SponsorAndPartnerModelCopyWith(SponsorAndPartnerModel value, $Res Function(SponsorAndPartnerModel) _then) = _$SponsorAndPartnerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sponsor') SponsorModel? sponsor,@JsonKey(name: 'partenaire') PartnerModel? partner
});


$SponsorModelCopyWith<$Res>? get sponsor;$PartnerModelCopyWith<$Res>? get partner;

}
/// @nodoc
class _$SponsorAndPartnerModelCopyWithImpl<$Res>
    implements $SponsorAndPartnerModelCopyWith<$Res> {
  _$SponsorAndPartnerModelCopyWithImpl(this._self, this._then);

  final SponsorAndPartnerModel _self;
  final $Res Function(SponsorAndPartnerModel) _then;

/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sponsor = freezed,Object? partner = freezed,}) {
  return _then(_self.copyWith(
sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as SponsorModel?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PartnerModel?,
  ));
}
/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorModelCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $SponsorModelCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerModelCopyWith<$Res>? get partner {
    if (_self.partner == null) {
    return null;
  }

  return $PartnerModelCopyWith<$Res>(_self.partner!, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}


/// Adds pattern-matching-related methods to [SponsorAndPartnerModel].
extension SponsorAndPartnerModelPatterns on SponsorAndPartnerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SponsorAndPartnerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SponsorAndPartnerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SponsorAndPartnerModel value)  $default,){
final _that = this;
switch (_that) {
case _SponsorAndPartnerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SponsorAndPartnerModel value)?  $default,){
final _that = this;
switch (_that) {
case _SponsorAndPartnerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sponsor')  SponsorModel? sponsor, @JsonKey(name: 'partenaire')  PartnerModel? partner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SponsorAndPartnerModel() when $default != null:
return $default(_that.sponsor,_that.partner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sponsor')  SponsorModel? sponsor, @JsonKey(name: 'partenaire')  PartnerModel? partner)  $default,) {final _that = this;
switch (_that) {
case _SponsorAndPartnerModel():
return $default(_that.sponsor,_that.partner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sponsor')  SponsorModel? sponsor, @JsonKey(name: 'partenaire')  PartnerModel? partner)?  $default,) {final _that = this;
switch (_that) {
case _SponsorAndPartnerModel() when $default != null:
return $default(_that.sponsor,_that.partner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SponsorAndPartnerModel extends SponsorAndPartnerModel {
  const _SponsorAndPartnerModel({@JsonKey(name: 'sponsor') this.sponsor, @JsonKey(name: 'partenaire') this.partner}): super._();
  factory _SponsorAndPartnerModel.fromJson(Map<String, dynamic> json) => _$SponsorAndPartnerModelFromJson(json);

@override@JsonKey(name: 'sponsor') final  SponsorModel? sponsor;
@override@JsonKey(name: 'partenaire') final  PartnerModel? partner;

/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SponsorAndPartnerModelCopyWith<_SponsorAndPartnerModel> get copyWith => __$SponsorAndPartnerModelCopyWithImpl<_SponsorAndPartnerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SponsorAndPartnerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SponsorAndPartnerModel&&(identical(other.sponsor, sponsor) || other.sponsor == sponsor)&&(identical(other.partner, partner) || other.partner == partner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sponsor,partner);

@override
String toString() {
  return 'SponsorAndPartnerModel(sponsor: $sponsor, partner: $partner)';
}


}

/// @nodoc
abstract mixin class _$SponsorAndPartnerModelCopyWith<$Res> implements $SponsorAndPartnerModelCopyWith<$Res> {
  factory _$SponsorAndPartnerModelCopyWith(_SponsorAndPartnerModel value, $Res Function(_SponsorAndPartnerModel) _then) = __$SponsorAndPartnerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sponsor') SponsorModel? sponsor,@JsonKey(name: 'partenaire') PartnerModel? partner
});


@override $SponsorModelCopyWith<$Res>? get sponsor;@override $PartnerModelCopyWith<$Res>? get partner;

}
/// @nodoc
class __$SponsorAndPartnerModelCopyWithImpl<$Res>
    implements _$SponsorAndPartnerModelCopyWith<$Res> {
  __$SponsorAndPartnerModelCopyWithImpl(this._self, this._then);

  final _SponsorAndPartnerModel _self;
  final $Res Function(_SponsorAndPartnerModel) _then;

/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sponsor = freezed,Object? partner = freezed,}) {
  return _then(_SponsorAndPartnerModel(
sponsor: freezed == sponsor ? _self.sponsor : sponsor // ignore: cast_nullable_to_non_nullable
as SponsorModel?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PartnerModel?,
  ));
}

/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SponsorModelCopyWith<$Res>? get sponsor {
    if (_self.sponsor == null) {
    return null;
  }

  return $SponsorModelCopyWith<$Res>(_self.sponsor!, (value) {
    return _then(_self.copyWith(sponsor: value));
  });
}/// Create a copy of SponsorAndPartnerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PartnerModelCopyWith<$Res>? get partner {
    if (_self.partner == null) {
    return null;
  }

  return $PartnerModelCopyWith<$Res>(_self.partner!, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}

// dart format on
