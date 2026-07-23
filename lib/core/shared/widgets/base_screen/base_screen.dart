import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/banner_partner.dart';
import 'package:kianja/core/shared/widgets/base_screen/banner_pub_loading.dart';
import 'package:kianja/core/shared/widgets/base_screen/banner_sponsor.dart';
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
              if (state.sponsorAndPartnerStatus ==
                      AppSponsorAndPartnerStatus.loaded &&
                  state.sponsorAndPartner.sponsor != null) {
                return InkWell(
                  onTap: () => context.pushNamed(
                    Routes.viewAdd.name,
                    extra: {'url': state.sponsorAndPartner.sponsor!.pageUrl},
                  ),
                  child: BannerSponsor(
                    sponsor: state.sponsorAndPartner.sponsor!,
                  ),
                );
              }
              return const BannerPubLoading();
            },
          ),
          Expanded(child: child),
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              if (state.sponsorAndPartnerStatus ==
                      AppSponsorAndPartnerStatus.loaded &&
                  state.sponsorAndPartner.partner != null) {
                return InkWell(
                  onTap: () => context.pushNamed(
                    Routes.viewAdd.name,
                    extra: {'url': state.sponsorAndPartner.partner!.pageUrl},
                  ),
                  child: BannerPartner(
                    partner: state.sponsorAndPartner.partner!,
                  ),
                );
              }
              return const BannerPubLoading();
            },
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
