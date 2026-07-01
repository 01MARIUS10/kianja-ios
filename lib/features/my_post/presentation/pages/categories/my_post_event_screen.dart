import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';
import 'package:kianja/features/my_post/presentation/widgets/hot_event/my_post_hot_event_dismissible.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';
import 'package:kianja/routing/routes.dart';

class MyPostEventScreen extends StatefulWidget {
  const MyPostEventScreen({super.key});

  @override
  State<MyPostEventScreen> createState() => _MyPostEventScreenState();
}

class _MyPostEventScreenState extends State<MyPostEventScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  List<HotEvent> _events = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  int? _processingEventId;
  Completer<void>? _refreshCompleter;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    final bloc = BlocProvider.of<MyPostBloc>(context);
    final state = bloc.state;
    if (state is MyPostGetAllEventsSuccess) {
      _events = state.events;
      _hasLoadedOnce = true;
    } else {
      bloc.add(
        const MyPostGetAllEventsRequested(
          queryPageParams: QueryPageParams(page: 1),
        ),
      );
    }
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

    final state = BlocProvider.of<MyPostBloc>(context).state;
    if (state is MyPostGetAllEventsSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<MyPostBloc>(
        context,
      ).add(const MyPostLoadMoreEventsRequested());
    }
  }

  void _onTap(HotEvent event) {
    context.pushNamed(
      Routes.trainingCenterHotEventDetail.name,
      pathParameters: {'id': event.id.toString()},
      extra: {'category': event.type.toUpperCase(), 'query': '/events'},
    );
  }

  Future<void> _onEdit(HotEvent event) async {
    final updatedEvent = await context.pushNamed<HotEvent>(
      Routes.myPostHotEventEdit.name,
      pathParameters: {'id': event.id.toString()},
      extra: event,
    );
    if (updatedEvent == null || !mounted) return;

    setState(() {
      final index = _events.indexWhere((e) => e.id == updatedEvent.id);
      if (index != -1) {
        _events[index] = updatedEvent;
      }
    });
  }

  void _onDelete(HotEvent event) {
    setState(() => _processingEventId = event.id);
    BlocProvider.of<MyPostBloc>(context).add(
      MyPostDeleteHotEventRequested(
        deleteHotEventParams: DeleteHotEventParams(
          id: event.id,
          type: event.type,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<MyPostBloc>(context).add(
      const MyPostGetAllEventsRequested(
        queryPageParams: QueryPageParams(page: 1),
      ),
    );
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return _refreshCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocConsumer<MyPostBloc, MyPostState>(
      listenWhen: (previous, current) =>
          current is MyPostGetAllEventsSuccess ||
          current is MyPostDeleteHotEventSuccess ||
          current is MyPostRequestFailure,
      listener: (context, state) {
        if (state is MyPostGetAllEventsSuccess) {
          setState(() {
            _events = state.events;
            _hasLoadedOnce = true;
            _errorMessage = null;
            _processingEventId = null;
          });
          if (_refreshCompleter != null) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
          }
        } else if (state is MyPostDeleteHotEventSuccess) {
          setState(() {
            _events.removeWhere((e) => e.id == state.deletedHotEventId);
            _processingEventId = null;
          });
        } else if (state is MyPostRequestFailure) {
          if (!_hasLoadedOnce) {
            setState(() {
              _errorMessage = state.message;
              _processingEventId = null;
            });
          } else {
            setState(() => _processingEventId = null);
            AppMessenger.showError(context, state.message);
          }
          if (_refreshCompleter != null) {
            _refreshCompleter?.complete();
            _refreshCompleter = null;
          }
        }
      },
      buildWhen: (previous, current) {
        if (current is MyPostRequestInProgress && _hasLoadedOnce) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (!_hasLoadedOnce && state is MyPostRequestInProgress) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!_hasLoadedOnce && _errorMessage != null) {
          return ServerFailureScreen(
            onRetry: () {
              BlocProvider.of<MyPostBloc>(context).add(
                const MyPostGetAllHotsRequested(
                  queryPageParams: QueryPageParams(page: 1),
                ),
              );
            },
            message: _errorMessage!,
          );
        }

        if (_hasLoadedOnce) {
          if (_events.isEmpty) {
            return Center(child: Text(context.appLoc.no_events_yet));
          }

          final hasMore = state is MyPostGetAllEventsSuccess && state.hasMore;

          final itemCount = hasMore ? _events.length + 1 : _events.length;

          return MyPostRefreshScreen(
            onRefresh: _refresh,
            child: ListView.separated(
              controller: _scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                vertical: Constants.paddingSmall,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (hasMore && index >= _events.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Constants.paddingMedium,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  );
                }

                final event = _events[index];
                return InkWell(
                  onTap: () => _onTap(event),
                  child: MyPostHotEventDismissible(
                    hotEvent: event,
                    isProcessing: _processingEventId == event.id,
                    onEditConfirmed: () => _onEdit(event),
                    onDeleteConfirmed: () => _onDelete(event),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: Constants.spacingExtraSmall);
              },
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
