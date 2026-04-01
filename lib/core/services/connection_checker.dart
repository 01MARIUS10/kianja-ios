import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class ConnectionChecker {
  Future<bool> get isConnected;
  Stream<bool> get onConnectionChanged;
}

class ConnectionCheckerImpl implements ConnectionChecker {
  const ConnectionCheckerImpl(this.connectivity);
  final Connectivity connectivity;

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }

  @override
  Stream<bool> get onConnectionChanged => connectivity.onConnectivityChanged
      .map((result) => !result.contains(ConnectivityResult.none));
}
