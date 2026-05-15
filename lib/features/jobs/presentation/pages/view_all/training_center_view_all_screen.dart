import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_training_centers_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/training_center_card.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterViewAllScreen extends StatelessWidget {
  const TrainingCenterViewAllScreen({
    super.key,
    required this.title,
    required this.query,
  });
  final String title;
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          ViewAllTrainingCentersRequested(
            viewAllTrainingCentersParams: ViewAllTrainingCentersParams(
              query: query,
            ),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: title),
        child: BlocConsumer<JobsBloc, JobsState>(
          listener: (context, state) {
            if (state is ViewAllTrainingCentersSuccess) {
              AppMessenger.showSuccess(context, 'View All Fetch Success');
            } else if (state is JobsRequestFailure) {
              // AppMessenger.showError(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is ViewAllTrainingCentersSuccess) {
              final trainingCenterList = state.trainingCenters;
              return AlignedGridView.count(
                padding: const EdgeInsets.symmetric(
                  vertical: Constants.paddingMedium,
                  horizontal: Constants.paddingMedium,
                ),
                addAutomaticKeepAlives: false,
                crossAxisCount: 2,
                crossAxisSpacing: Constants.spacingSmall,
                mainAxisSpacing: Constants.spacingMedium,
                itemCount: trainingCenterList.length,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(
                          Routes.trainingCenterDetail.name,
                          pathParameters: {
                            'id': trainingCenterList[index].id.toString(),
                          },
                        );
                      },
                      child: TrainingCenterCard(
                        trainingCenter: trainingCenterList[index],
                        widthViewEnum: WidthViewEnum.grid,
                      ),
                    ),
                  );
                },
              );
            } else if (state is JobsRequestFailure) {
              if (state.message.contains('connection')) {
                return NoConnectionScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(context).add(
                      ViewAllTrainingCentersRequested(
                        viewAllTrainingCentersParams:
                            ViewAllTrainingCentersParams(query: query),
                      ),
                    );
                  },
                );
              } else {
                return ServerFailureScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(context).add(
                      ViewAllTrainingCentersRequested(
                        viewAllTrainingCentersParams:
                            ViewAllTrainingCentersParams(query: query),
                      ),
                    );
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
