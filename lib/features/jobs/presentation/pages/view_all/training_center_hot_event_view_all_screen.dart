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
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/width_view_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/card/hot_event_card.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterHotEventViewAllScreen extends StatelessWidget {
  const TrainingCenterHotEventViewAllScreen({
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
          ViewAllHotEventsRequested(
            queryPageParams: QueryPageParams(query: query, page: 1),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: title),
        child: _HotEventViewAllContent(title: title, query: query),
      ),
    );
  }
}

class _HotEventViewAllContent extends StatefulWidget {
  const _HotEventViewAllContent({required this.title, required this.query});
  final String title;
  final String query;

  @override
  State<_HotEventViewAllContent> createState() =>
      _HotEventViewAllContentState();
}

class _HotEventViewAllContentState extends State<_HotEventViewAllContent> {
  final ScrollController _scrollController = ScrollController();

  List<HotEvent> _hotEvents = [];
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
    if (state is ViewAllHotEventsSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<JobsBloc>(
        context,
      ).add(const LoadMoreHotEventsRequested());
    }
  }

  void _fetchFirstPage() {
    BlocProvider.of<JobsBloc>(context).add(
      ViewAllHotEventsRequested(
        queryPageParams: QueryPageParams(query: widget.query, page: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JobsBloc, JobsState>(
      listenWhen: (previous, current) =>
          current is ViewAllHotEventsSuccess || current is JobsRequestFailure,
      listener: (context, state) {
        if (state is ViewAllHotEventsSuccess) {
          setState(() {
            _hotEvents = state.hotEvents;
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
                  itemCount: _hotEvents.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.topCenter,
                      child: InkWell(
                        onTap: () {
                          context.pushNamed(
                            Routes.trainingCenterHotEventDetail.name,
                            pathParameters: {
                              'id': _hotEvents[index].id.toString(),
                            },
                            extra: {
                              'category': widget.title,
                              'query': widget.query,
                            },
                          );
                        },
                        child: HotEventCard(
                          hotEvent: _hotEvents[index],
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
