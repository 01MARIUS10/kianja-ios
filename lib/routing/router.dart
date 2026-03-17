import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/home/presentation/pages/home_screen.dart';
import 'package:kianja/routing/routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return const HomeScreen(title: Constants.appName);
      },
    ),
  ],
);

Future<String?> _redirect(BuildContext context, GoRouterState state) async {
  return null;
}
