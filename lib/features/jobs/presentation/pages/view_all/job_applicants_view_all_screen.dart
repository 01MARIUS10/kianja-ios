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
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/job_applicant_card.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicantsViewAllScreen extends StatelessWidget {
  const JobApplicantsViewAllScreen({
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
          JobApplicantsViewAllFetchRequested(
            queryPageParams: QueryPageParams(query: query, page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: title),
        child: _JobApplicantViewAllContent(query: query),
      ),
    );
  }
}

class _JobApplicantViewAllContent extends StatefulWidget {
  const _JobApplicantViewAllContent({required this.query});
  final String query;

  @override
  State<_JobApplicantViewAllContent> createState() =>
      _JobApplicantViewAllContentState();
}

class _JobApplicantViewAllContentState
    extends State<_JobApplicantViewAllContent> {
  final ScrollController _scrollController = ScrollController();

  List<JobApplicant> _jobApplicants = [];
  bool _hasLoadedOnce = false;
  bool _hasMore = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.maxScrollExtent - position.pixels > 300) return;

    final state = BlocProvider.of<JobsBloc>(context).state;
    if (state is JobApplicantsViewAllFetchSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<JobsBloc>(
        context,
      ).add(const JobApplicantLoadMoreViewAllRequested());
    }
  }

  void _fetchFirstPage() {
    BlocProvider.of<JobsBloc>(context).add(
      JobApplicantsViewAllFetchRequested(
        queryPageParams: QueryPageParams(query: widget.query, page: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsBloc, JobsState>(
      listenWhen: (previous, current) =>
          current is JobApplicantsViewAllFetchSuccess ||
          current is JobsRequestFailure,
      listener: (context, state) {
        if (state is JobApplicantsViewAllFetchSuccess) {
          setState(() {
            _jobApplicants = state.jobApplicants;
            _hasMore = state.hasMore;
            _hasLoadedOnce = true;
            _errorMessage = null;
          });
        } else if (state is JobsRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() => _errorMessage = state.message);
          } else {
            AppMessenger.showError(context, state.message);
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is JobsRequestInProgress && _hasLoadedOnce) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (!_hasLoadedOnce && state is JobsRequestInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_hasLoadedOnce && _errorMessage != null) {
          if (_errorMessage!.contains('connection')) {
            return NoConnectionScreen(onRetry: _fetchFirstPage);
          }
          return ServerFailureScreen(
            onRetry: _fetchFirstPage,
            message: _errorMessage!,
          );
        }

        if (_hasLoadedOnce) {
          return CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: Constants.paddingMedium,
                  horizontal: Constants.paddingMedium,
                ),
                sliver: SliverAlignedGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: Constants.spacingSmall,
                  mainAxisSpacing: Constants.spacingMedium,
                  itemCount: _jobApplicants.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                            Routes.jobApplicantDetail.name,
                            pathParameters: {
                              'id': _jobApplicants[index].id.toString(),
                            },
                          );
                        },
                        child: JobApplicantCard(
                          jobApplicant: _jobApplicants[index],
                          widthViewEnum: WidthViewEnum.grid,
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_hasMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
