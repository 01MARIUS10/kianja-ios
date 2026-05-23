import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/my_post/presentation/pages/categories/my_post_expert_executive_screen.dart';
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
    return BaseScreen(
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
                // Tab(text: 'Experts & executes'),
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
                // MyPostExpertExecutiveScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
