import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
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
    _tabController = TabController(length: 3, vsync: this);
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
        appBar: const TitleHeader(title: 'My post'),
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
                tabAlignment: TabAlignment.fill,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Job offers'),
                  Tab(text: 'Job applicants'),
                  Tab(text: 'Training centers'),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
