import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/logo_header.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/presentation/jobs_tab_reset_notifier.dart';
import 'package:kianja/features/jobs/presentation/pages/job_applicant/job_applicants_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/job_offer/job_offers_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/post/post_experts_executives_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/training_center/training_center_screen.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> with TickerProviderStateMixin {
  late final TabController _tabController;
  late final JobsTabResetNotifier _resetNotifier;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _resetNotifier = GetIt.instance<JobsTabResetNotifier>();
    _resetNotifier.addListener(_resetToInitial);
  }

  void _resetToInitial() {
    if (!mounted || _tabController.index == 0) return;
    _tabController.index = 0;
  }

  @override
  void dispose() {
    _resetNotifier.removeListener(_resetToInitial);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: LogoHeader(title: EnvConfig.appName),
      child: Column(
        children: [
          SizedBox(
            height: Constants.size40,
            child: TabBar(
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
                vertical: Constants.spacingZero,
              ),
              controller: _tabController,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (value) {
                if (value == 0) {
                  BlocProvider.of<AppBloc>(
                    context,
                  ).add(const AppSponsorAndPartnerLoaded(menuId: 1));
                } else if (value == 1) {
                  BlocProvider.of<AppBloc>(
                    context,
                  ).add(const AppSponsorAndPartnerLoaded(menuId: 2));
                } else if (value == 2) {
                  BlocProvider.of<AppBloc>(
                    context,
                  ).add(const AppSponsorAndPartnerLoaded(menuId: 3));
                } else if (value == 3) {
                  BlocProvider.of<AppBloc>(
                    context,
                  ).add(const AppSponsorAndPartnerLoaded(menuId: 4));
                }
              },

              // indicatorColor: Colors.transparent,
              tabs: [
                Tab(text: context.appLoc.job_offers),
                Tab(text: context.appLoc.job_applicants),
                Tab(text: context.appLoc.training_centers),
                Tab(text: context.appLoc.expert_executive),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                JobOffersScreen(),
                JobApplicantsScreen(),
                TrainingCenterScreen(),
                PostExpertsExecutivesScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
