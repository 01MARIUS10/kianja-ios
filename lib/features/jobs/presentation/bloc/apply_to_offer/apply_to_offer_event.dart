part of 'apply_to_offer_bloc.dart';

@freezed
class ApplyToOfferEvent with _$ApplyToOfferEvent {
  const factory ApplyToOfferEvent.started() = _Started;
}

class ApplyToOfferStarted implements ApplyToOfferEvent {
  const ApplyToOfferStarted({required this.id});
  final int id;
}
