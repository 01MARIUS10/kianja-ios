part of 'connectivity_bloc.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

final class ConnectivityInitial extends ConnectivityState {}

final class ConnectivityConnectionSuccess extends ConnectivityState {}

final class ConnectivityConnectionFailure extends ConnectivityState {}
