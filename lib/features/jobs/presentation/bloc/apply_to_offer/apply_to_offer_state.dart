part of 'apply_to_offer_bloc.dart';

@freezed
class ApplyToOfferState with _$ApplyToOfferState {
  const factory ApplyToOfferState.initial() = _Initial;
}

class ApplyToOfferInProgress implements ApplyToOfferState {}

class ApplyToOfferSuccess implements ApplyToOfferState {
  const ApplyToOfferSuccess({required this.message});
  final String message;
}

class ApplyToOfferFailure implements ApplyToOfferState {
  const ApplyToOfferFailure({required this.error});
  final String error;
}
