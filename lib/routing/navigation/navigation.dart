import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/utils/app_messenger.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BlocConsumer<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          return switch (state) {
            ConnectivityConnectionSuccess() => ScaffoldMessenger.of(
              context,
            ).clearSnackBars(),
            ConnectivityConnectionFailure() => AppMessenger.showWarning(
              context,
              'No internet connection',
            ),
            ConnectivityInitial() => null,
          };
        },
        builder: (context, state) {
          return BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: navigationShell.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: navigationShell.goBranch,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.work),
                    label: 'Jobs',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_rounded),
                    label: 'My post',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
