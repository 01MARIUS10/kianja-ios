import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/connectivity/connectivity_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/presentation/jobs_tab_reset_notifier.dart';
import 'package:kianja/routing/routes.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        AppDebug.showPrint('didPop: $didPop, result: $result');
        final GoRouterState appRouteState = GoRouterState.of(context);
        final jobsRoute = appRouteState.uri.toString() == Routes.jobs.path;
        AppDebug.showPrint('appRouteState.uri ${appRouteState.uri}');
        AppDebug.showPrint('jobsRoute $jobsRoute');
        if (jobsRoute) {
          SystemNavigator.pop();
        } else {
          navigationShell.goBranch(0);
        }
      },
      child: Scaffold(
        body: SafeArea(child: navigationShell),
        bottomNavigationBar: BlocConsumer<ConnectivityBloc, ConnectivityState>(
          listener: (context, state) {
            // return switch (state) {
            //   ConnectivityConnectionSuccess() => {
            //     ScaffoldMessenger.of(context).clearSnackBars(),
            //     BlocProvider.of<AppBloc>(context).add(const AppUserLoaded()),
            //   },
            //   ConnectivityConnectionFailure() => AppMessenger.showWarning(
            //     context,
            //     'No internet connection',
            //   ),
            //   ConnectivityInitial() => null,
            // };
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
                    BlocProvider.of<AppBloc>(
                      context,
                    ).add(const AppUserDeleted());
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
                  iconSize: Constants.iconSizeExtraSmall,
                  selectedLabelStyle: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    AppDebug.showPrint(
                      'selected index $index current index ${navigationShell.currentIndex}',
                    );
                    final GoRouterState appRouteState = GoRouterState.of(
                      context,
                    );
                    final accountRoute =
                        appRouteState.matchedLocation == Routes.account.path;
                    navigationShell.goBranch(index);
                    // Manage the account expired session
                    if (index == 3 && accountRoute) {
                      BlocProvider.of<AppBloc>(
                        context,
                      ).add(const AppUserLoaded());
                    }

                    if (index == 0) {
                      if (appRouteState.uri.path != Routes.jobs.path) {
                        context.go(Routes.jobs.path);
                      }
                      GetIt.instance<JobsTabResetNotifier>().reset();
                    }
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.work,
                        size: Constants.iconSizeSmall,
                      ),
                      label: context.appLoc.jobs,
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.favorite,
                        size: Constants.iconSizeSmall,
                      ),
                      label: context.appLoc.favorites,
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(
                        Icons.add_circle,
                        size: Constants.iconSizeSmall * 1.6,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(
                        Icons.assignment_rounded,
                        size: Constants.iconSizeSmall,
                      ),
                      label: context.appLoc.my_post,
                    ),
                    BottomNavigationBarItem(
                      icon:
                          (state.userStatus == AppUserStatus.loaded &&
                              state.isAuthenticated == true)
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                Constants.borderRadiusSmall,
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '${EnvConfig.baseApiUrl}${state.user.photoUrl}',
                                fit: BoxFit.cover,
                                width: Constants.iconSizeSmall,
                                height: Constants.iconSizeSmall,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (_, _, _) => const DefaultAvatar(
                                  size: Constants.iconSizeSmall,
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.person,
                              size: Constants.iconSizeSmall,
                            ),
                      label: context.appLoc.account,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
