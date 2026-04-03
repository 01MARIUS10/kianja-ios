import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/shared/widgets/app/session_expired.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/routing/routes.dart';

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
            ConnectivityConnectionSuccess() => {
              ScaffoldMessenger.of(context).clearSnackBars(),
              BlocProvider.of<AppBloc>(context).add(const AppUserLoaded()),
            },
            ConnectivityConnectionFailure() => AppMessenger.showWarning(
              context,
              'No internet connection',
            ),
            ConnectivityInitial() => null,
          };
        },
        builder: (context, state) {
          return BlocConsumer<AppBloc, AppState>(
            listenWhen: (previous, current) {
              return (previous.userStatus != current.userStatus);
            },
            listener: (context, state) {
              final GoRouterState appRouteState = GoRouterState.of(context);
              final accountRoute =
                  appRouteState.matchedLocation == Routes.account.path;
              // Manage the account expired session
              if (accountRoute) {
                if (state.userStatus == AppUserStatus.sessionExpired) {
                  BlocProvider.of<AppBloc>(context).add(const AppUserDeleted());
                }
                if (state.userStatus == AppUserStatus.deleted) {
                  if (context.canPop()) {
                    context.pop();
                  }
                  context.goNamed(Routes.signIn.name);
                }
              }
            },
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: navigationShell.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  final GoRouterState appRouteState = GoRouterState.of(context);
                  final accountRoute =
                      appRouteState.matchedLocation == Routes.account.path;
                  navigationShell.goBranch(index);
                  // Manage the account expired session
                  if (index == 2 && accountRoute) {
                    BlocProvider.of<AppBloc>(
                      context,
                    ).add(const AppUserLoaded());
                  }
                },
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
