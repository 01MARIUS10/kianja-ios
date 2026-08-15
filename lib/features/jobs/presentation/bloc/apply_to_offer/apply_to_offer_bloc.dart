import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/usecases/apply_to_offer_usecase.dart';

part 'apply_to_offer_event.dart';
part 'apply_to_offer_state.dart';
part 'apply_to_offer_bloc.freezed.dart';

class ApplyToOfferBloc extends Bloc<ApplyToOfferEvent, ApplyToOfferState> {
  ApplyToOfferBloc({required this._applyToOfferUseCase})
    : super(const _Initial()) {
    on<ApplyToOfferStarted>(_onApplyToOfferRequested);
  }
  final ApplyToOfferUseCase _applyToOfferUseCase;

  Future<void> _onApplyToOfferRequested(
    ApplyToOfferStarted event,
    Emitter<ApplyToOfferState> emit,
  ) async {
    emit(ApplyToOfferInProgress());
    final result = await _applyToOfferUseCase(ApplyToOfferParams(id: event.id));
    result.fold((failure) {
      if (failure.statusCode == 409) {
        emit(
          const ApplyToOfferFailure(
            error: 'Vous avez déjà postulé à cette offre',
          ),
        );
      } else if (failure.statusCode == 404) {
        emit(const ApplyToOfferFailure(error: 'Offre non trouvée'));
      } else if (failure.statusCode == 401) {
        emit(const ApplyToOfferFailure(error: 'Accès non autorisé'));
      } else {
        emit(ApplyToOfferFailure(error: failure.message));
      }
    }, (message) => emit(ApplyToOfferSuccess(message: message)));
  }
}
