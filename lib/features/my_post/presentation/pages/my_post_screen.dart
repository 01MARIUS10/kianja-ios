import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/pages/categories/my_post_event_screen.dart';
// import 'package:kianja/features/my_post/presentation/pages/categories/my_post_hot_screen.dart';
import 'package:kianja/features/my_post/presentation/pages/categories/my_post_job_applicant_screen.dart';
import 'package:kianja/features/my_post/presentation/pages/categories/my_post_job_offer_screen.dart';
import 'package:kianja/features/my_post/presentation/pages/categories/my_post_training_center_screen.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key});

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<MyPostBloc>()
        ..add(
          const MyPostGetAllJobOffersRequested(
            queryPageParams: QueryPageParams(page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.my_post),
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
                  AppDebug.showPrint('Page value : $value');
                },
                tabs: [
                  Tab(text: context.appLoc.job_offers),
                  Tab(text: context.appLoc.job_applicants),
                  Tab(text: context.appLoc.training_centers),
                  // Tab(text: context.appLoc.hots),
                  Tab(text: context.appLoc.events),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  MyPostJobOfferScreen(),
                  MyPostJobApplicantScreen(),
                  MyPostTrainingCenterScreen(),
                  // MyPostHotScreen(),
                  MyPostEventScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
