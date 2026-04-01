import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/account/presentation/pages/account_screen.dart';
import 'package:kianja/features/account/presentation/pages/change_password/change_password_screen.dart';
import 'package:kianja/features/account/presentation/pages/personal_info/personal_info_screen.dart';
import 'package:kianja/features/account/presentation/pages/personal_info/update_personal_info_screen.dart';
import 'package:kianja/features/auth/presentation/pages/signin_screen.dart';
import 'package:kianja/features/auth/presentation/pages/signup_screen.dart';
import 'package:kianja/features/choose_lang/presentation/pages/choose_lang_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/jobs_screen.dart';
import 'package:kianja/features/my_post/presentation/pages/my_post_screen.dart';
import 'package:kianja/routing/navigation/navigation.dart';
import 'package:kianja/routing/routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorJobsKey = GlobalKey<NavigatorState>();
final _shellNavigatorMyPostKey = GlobalKey<NavigatorState>();
final _shellNavigatorAccountKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final _appBlocNotifier = _AppBlocNotifier();
  static GoRouter buildRouter(AppBloc appBloc) {
    _appBlocNotifier.update(appBloc);
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.jobs.path,
      debugLogDiagnostics: true,
      refreshListenable: _appBlocNotifier,
      redirect: (context, state) {
        final appState = appBloc.state;
        final isAuthenticated = appState.isAuthenticated;
        AppDebug.showPrint('AppRouter redirect');
        AppDebug.showPrint('matchedLocation: ${state.matchedLocation}');
        AppDebug.showPrint(
          'isAlreadyChosenLang: ${appState.isAlreadyChosenLang}',
        );
        AppDebug.showPrint('isAuthenticated: $isAuthenticated');
        if (state.matchedLocation == Routes.chooseLang.path &&
            appState.isAlreadyChosenLang == true) {
          return Routes.jobs.path;
        }
        if (appState.isAlreadyChosenLang == false) {
          return Routes.chooseLang.path;
        }
        if (state.matchedLocation == Routes.myPost.path &&
            isAuthenticated == false) {
          return Routes.signIn.path;
        }
        if (state.matchedLocation == Routes.account.path &&
            isAuthenticated == false) {
          return Routes.signIn.path;
        }

        return null;
      },
      routes: [
        // ================= CHOOSE LANG =================
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: Routes.chooseLang.name,
          path: Routes.chooseLang.path,
          builder: (context, state) {
            return const ChooseLangScreen();
          },
        ),
        // ================= NAVIGATION (SHELL) =================
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          branches: [
            // Jobs branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorJobsKey,
              routes: [
                GoRoute(
                  name: Routes.jobs.name,
                  path: Routes.jobs.path,
                  builder: (context, state) {
                    return const JobsScreen();
                  },
                ),
              ],
            ),
            // My post branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorMyPostKey,
              routes: [
                GoRoute(
                  name: Routes.myPost.name,
                  path: Routes.myPost.path,
                  builder: (context, state) {
                    return const MyPostScreen();
                  },
                ),
              ],
            ),
            // Account branch
            StatefulShellBranch(
              navigatorKey: _shellNavigatorAccountKey,
              routes: [
                GoRoute(
                  name: Routes.account.name,
                  path: Routes.account.path,
                  builder: (context, state) {
                    return const AccountScreen();
                  },
                  routes: [
                    GoRoute(
                      name: Routes.personalInfo.name,
                      path: Routes.personalInfo.path,
                      builder: (context, state) {
                        return const PersonalInfoScreen();
                      },
                      routes: [
                        GoRoute(
                          name: Routes.updatePersonalInfo.name,
                          path: Routes.updatePersonalInfo.path,
                          builder: (context, state) {
                            return const UpdatePersonalInfoScreen();
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      name: Routes.changePassword.name,
                      path: Routes.changePassword.path,
                      builder: (context, state) {
                        return const ChangePasswordScreen();
                      },
                    ),
                  ],
                ),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorAccountKey,
                  name: Routes.signIn.name,
                  path: Routes.signIn.path,
                  builder: (context, state) {
                    return const SignInScreen();
                  },
                ),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorAccountKey,
                  name: Routes.signUp.name,
                  path: Routes.signUp.path,
                  builder: (context, state) {
                    return const SignUpScreen();
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
  }
}

class _AppBlocNotifier extends ChangeNotifier {
  StreamSubscription? _subscription;

  void update(AppBloc appBloc) {
    _subscription?.cancel();
    _subscription = appBloc.stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
