import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_events_list/saved_events_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_hots_list/saved_hots_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_job_applicants_list/saved_job_applicants_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_list/saved_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_training_centers_list/saved_training_centers_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/pages/saved/saved_event_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/saved/saved_hot_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/saved/saved_job_applicant_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/saved/saved_job_offer_screen.dart';
import 'package:kianja/features/jobs/presentation/pages/saved/saved_training_center_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SavedListBloc>(
          create: (_) => GetIt.instance<SavedListBloc>()
            ..add(
              const SavedListJobOffersLoaded(
                queryPageParams: QueryPageParams(page: 1),
              ),
            ),
        ),
        BlocProvider<SavedJobApplicantsListBloc>(
          create: (_) => GetIt.instance<SavedJobApplicantsListBloc>()
            ..add(
              const SavedJobApplicantsListLoaded(
                queryPageParams: QueryPageParams(page: 1),
              ),
            ),
        ),
        BlocProvider<SavedTrainingCentersListBloc>(
          create: (_) => GetIt.instance<SavedTrainingCentersListBloc>()
            ..add(
              const SavedTrainingCentersListLoaded(
                queryPageParams: QueryPageParams(page: 1),
              ),
            ),
        ),
        BlocProvider<SavedHotsListBloc>(
          create: (_) => GetIt.instance<SavedHotsListBloc>()
            ..add(
              const SavedHotsListLoaded(
                queryPageParams: QueryPageParams(page: 1),
              ),
            ),
        ),
        BlocProvider<SavedEventsListBloc>(
          create: (_) => GetIt.instance<SavedEventsListBloc>()
            ..add(
              const SavedEventsListLoaded(
                queryPageParams: QueryPageParams(page: 1),
              ),
            ),
        ),
        BlocProvider<SaveContentBloc>(
          create: (_) => GetIt.instance<SaveContentBloc>(),
        ),
      ],
      child: BaseScreen(
        appBar: const TitleHeader(title: 'My recordings'),
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
                  Tab(text: context.appLoc.hots),
                  Tab(text: context.appLoc.events),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  SavedJobOfferScreen(),
                  SavedJobApplicantScreen(),
                  SavedTrainingCenterScreen(),
                  SavedHotScreen(),
                  SavedEventScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
