import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_section.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/routing/routes.dart';

class ProlongerJobApplicantScreen extends StatefulWidget {
  const ProlongerJobApplicantScreen({super.key, required this.id});
  final int id;

  @override
  State<ProlongerJobApplicantScreen> createState() =>
      _ProlongerJobApplicantScreenState();
}

class _ProlongerJobApplicantScreenState
    extends State<ProlongerJobApplicantScreen> {
  List<PricePlan> _plans = [];
  PricePlan? _selectedPlan;
  bool _isLoadingExtension = false;

  void _clearValues() {
    setState(() {
      _selectedPlan = null;
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────
  void _postJobApplicant(BuildContext context) {
    if (_selectedPlan == null) {
      AppMessenger.showWarning(context, 'Please select a plan');
      return;
    }
    AppDebug.showPrint('typeId: ${_selectedPlan!.type.id}');
    AppDebug.showPrint('durationId: ${_selectedPlan!.duration.id}');

    BlocProvider.of<MyPostBloc>(context).add(
      MyPostProlongerJobApplicantRequested(
        prolongerJobApplicantParams: ProlongerJobApplicantParams(
          id: widget.id,
          typeId: _selectedPlan!.type.id,
          durationId: _selectedPlan!.duration.id,
        ),
      ),
    );
  }

  // ── Build ──────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<JobsBloc>()
            ..add(const JobFeaturesFetchRequested())
            ..add(
              const JobsGetPricePlanRequested(
                getPricePlanParams: GetPricePlanParams(plan: 'job-applicant'),
              ),
            ),
        ),
        BlocProvider(create: (context) => GetIt.instance<MyPostBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<MyPostBloc, MyPostState>(
            listener: (context, state) {
              if (state is MyPostProlongerJobApplicantSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.prolongerJobApplicantSuccessful.name,
                  pathParameters: {
                    'id': state.jobApplicant.id.toString(),
                    'jobAppId': state.jobApplicant.id.toString(),
                  },
                );
              } else if (state is MyPostRequestFailure) {
                if (state.message == 'Unprocessable entity') {
                  AppMessenger.showError(
                    context,
                    context.appLoc.no_enough_kara,
                  );
                } else {
                  AppMessenger.showError(context, state.message);
                }
              } else if (state is MyPostRequestInProgress) {
                _isLoadingExtension = true;
              }
            },
            child: BlocConsumer<JobsBloc, JobsState>(
              listener: (context, state) {
                if (state is JobsGetPricePlanSuccess) {
                  setState(() => _plans = state.pricePlans);
                } else if (state is JobsRequestFailure) {
                  if (state.message == 'Unprocessable entity') {
                    AppMessenger.showError(
                      context,
                      context.appLoc.no_enough_kara,
                    );
                  } else {
                    AppMessenger.showError(context, state.message);
                  }
                }
              },
              builder: (context, state) {
                final isLoading = state is JobsRequestInProgress;

                return BaseScreen(
                  appBar: TitleHeader(title: context.appLoc.extension),
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                        vertical: Constants.paddingMedium,
                      ),
                      child: isLoading
                          ? const Column(
                              children: [
                                Center(child: CircularProgressIndicator()),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ── Post Features Section ────────────────────────
                                PostFeaturesSection(
                                  plans: _plans,
                                  isLoading: _isLoadingExtension,
                                  onPlanSelected: (plan) {
                                    _selectedPlan = plan;
                                  },
                                  onPost: () => _postJobApplicant(context),
                                  postButtonLabel: context.appLoc.apply
                                      .toUpperCase(),
                                ),
                              ],
                            ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
