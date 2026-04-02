import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';

class NetworkAwareWidget extends StatefulWidget {
  const NetworkAwareWidget({super.key, required this.child});
  final Widget child;

  @override
  State<NetworkAwareWidget> createState() => _NetworkAwareWidgetState();
}

class _NetworkAwareWidgetState extends State<NetworkAwareWidget>
    with AutomaticKeepAliveClientMixin {
  bool _isLoading = true;
  bool _hasError = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _checkInitialConnection();
  }

  void _checkInitialConnection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _performCheck();
    });
  }

  Future<void> _performCheck() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    final connectivityBloc = BlocProvider.of<ConnectivityBloc>(context);
    // Simulate network delay logic to make loading visible on retry
    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    final connectivityState = connectivityBloc.state;
    if (connectivityState is ConnectivityConnectionFailure) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    } else {
      setState(() {
        _hasError = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
      );
    }

    if (_hasError) {
      return SingleChildScrollView(
        key: const PageStorageKey<String>('no_connection'),
        child: NoConnectionScreen(onRetry: _performCheck),
      );
    }

    return widget.child;
  }
}
