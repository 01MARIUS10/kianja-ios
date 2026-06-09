import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/banner_pub.dart';
import 'package:kianja/routing/routes.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    required this.child,
    this.appBar,
    this.bottomNavigationBar,
  });
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.sponsPartners.isEmpty) {
                return const SizedBox.shrink();
              }
              return InkWell(
                onTap: () => context.pushNamed(
                  Routes.viewAdd.name,
                  extra: {'url': state.sponsPartners.first.pageUrl},
                ),
                child: BannerPub(sponsPartner: state.sponsPartners.first),
              );
            },
          ),
          Expanded(child: child),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.sponsPartners.isEmpty) {
                return const SizedBox.shrink();
              }
              return InkWell(
                onTap: () => context.pushNamed(
                  Routes.viewAdd.name,
                  extra: {'url': state.sponsPartners.last.pageUrl},
                ),
                child: BannerPub(sponsPartner: state.sponsPartners.last),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
