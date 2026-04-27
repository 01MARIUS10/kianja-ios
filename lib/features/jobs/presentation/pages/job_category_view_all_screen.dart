import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/job_offer_card.dart';
import 'package:kianja/routing/routes.dart';

class JobCategoryViewAllScreen extends StatelessWidget {
  const JobCategoryViewAllScreen({
    super.key,
    required this.title,
    required this.query,
  });
  final String title;
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()
            ..add(JobsViewAllFetchRequested(query: query)),
      child: BaseScreen(
        appBar: TitleHeader(title: title),
        child: BlocConsumer<JobsBloc, JobsState>(
          listener: (context, state) {
            if (state is JobsViewAllFetchSuccess) {
              AppMessenger.showSuccess(context, 'View All Fetch Success');
            } else if (state is JobsRequestFailure) {
              // AppMessenger.showError(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is JobsViewAllFetchSuccess) {
              final jobOfferList = state.jobOffers;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: Constants.spacingMedium),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: Constants.spacingSmall,
                            mainAxisSpacing: Constants.spacingMedium,
                            childAspectRatio: 0.74,
                          ),
                      itemCount: jobOfferList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                              Routes.jobOfferDetail.name,
                              pathParameters: {
                                'id': jobOfferList[index].id.toString(),
                              },
                            );
                          },
                          child: JobOfferCard(jobOffer: jobOfferList[index]),
                        );
                      },
                    ),
                    const SizedBox(height: Constants.spacingMedium),
                  ],
                ),
              );
            } else if (state is JobsRequestFailure) {
              if (state.message.contains('connection')) {
                return NoConnectionScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(
                      context,
                    ).add(JobsViewAllFetchRequested(query: query));
                  },
                );
              } else {
                return ServerFailureScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(
                      context,
                    ).add(JobsViewAllFetchRequested(query: query));
                  },
                );
              }
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
