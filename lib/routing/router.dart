import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/bloc/app/app_bloc.dart';
import 'package:kianja/features/choose_lang/presentation/pages/choose_lang_screen.dart';
import 'package:kianja/features/home/presentation/pages/home_screen.dart';
import 'package:kianja/routing/navigation/navigation.dart';
import 'package:kianja/routing/routes.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
// final _parentNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorJobsKey = GlobalKey<NavigatorState>();
// final _shellNavigatorMyPostKey = GlobalKey<NavigatorState>();
// final _shellNavigatorAccountKey = GlobalKey<NavigatorState>();

GoRouter router() => GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  routes: [
    // ================= CHOOSE LANG =================
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: Routes.chooseLang,
      builder: (context, state) {
        return const ChooseLangScreen();
      },
    ),
    // ================= NAVIGATION (SHELL) =================
    StatefulShellRoute.indexedStack(
      // parentNavigatorKey: _parentNavigatorKey,
      branches: [
        // Jobs branch
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorJobsKey,
          routes: [
            GoRoute(
              path: Routes.home,
              builder: (context, state) {
                return HomeScreen(title: EnvConfig.appName);
              },
            ),
          ],
        ),
        // My post branch
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorMyPostKey,
          routes: [
            GoRoute(
              path: Routes.myPost,
              builder: (context, state) {
                return SafeArea(child: Container(color: Colors.red));
              },
            ),
          ],
        ),
        // Account branch
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorAccountKey,
          routes: [
            GoRoute(
              path: Routes.account,
              builder: (context, state) {
                return SafeArea(child: Container(color: Colors.blue));
              },
            ),
          ],
        ),
      ],
      builder: (context, state, navigationShell) {
        return Navigation(navigationShell: navigationShell);
      },
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
  if (BlocProvider.of<AppBloc>(context).state.isAlreadyChosenLang == false) {
    return Routes.chooseLang;
  }
  return null;
}
