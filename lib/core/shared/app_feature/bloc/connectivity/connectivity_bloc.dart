import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/services/connection_checker.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc({required ConnectionChecker connectionChecker})
    : _connectionChecker = connectionChecker,
      super(ConnectivityInitial()) {
    on<ConnectivitySubscribed>(_onConnectivitySubscribed);
    on<ConnectivityChanged>(_onConnectivityChanged);
  }

  final ConnectionChecker _connectionChecker;
  StreamSubscription<bool>? _connectivitySubscription;

  void _onConnectivitySubscribed(
    ConnectivitySubscribed event,
    Emitter<ConnectivityState> emit,
  ) async {
    // Check initial connection
    final isConnected = await _connectionChecker.isConnected;
    add(ConnectivityChanged(isConnected));

    // Listen to changes
    await _connectivitySubscription?.cancel();
    _connectivitySubscription = _connectionChecker.onConnectionChanged.listen((
      isConnected,
    ) {
      add(ConnectivityChanged(isConnected));
    });
  }

  void _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    if (event.isConnected) {
      emit(ConnectivityConnectionSuccess());
    } else {
      emit(ConnectivityConnectionFailure());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
