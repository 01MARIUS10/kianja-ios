part of 'connectivity_bloc.dart';

sealed class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

final class ConnectivitySubscribed extends ConnectivityEvent {
  const ConnectivitySubscribed();
}

final class ConnectivityChanged extends ConnectivityEvent {
  const ConnectivityChanged(this.isConnected);
  final bool isConnected;

  @override
  List<Object> get props => [isConnected];
}
