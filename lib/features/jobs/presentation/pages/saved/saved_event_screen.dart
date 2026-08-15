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
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_events_list/saved_events_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/save_hot_event_content_dismissible.dart';
import 'package:kianja/routing/routes.dart';

class SavedEventScreen extends StatefulWidget {
  const SavedEventScreen({super.key});

  @override
  State<SavedEventScreen> createState() => _SavedEventScreenState();
}

class _SavedEventScreenState extends State<SavedEventScreen>
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

    final state = BlocProvider.of<SavedEventsListBloc>(context).state;
    if (state is SavedEventsListLoadSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<SavedEventsListBloc>(
        context,
      ).add(const SavedEventsListLoadMore());
    }
  }

  void _onTap(HotEvent event) {
    context.pushNamed(
      Routes.trainingCenterHotEventDetail.name,
      pathParameters: {'id': event.id.toString()},
      extra: {'category': event.type.toUpperCase(), 'query': '/events'},
    );
  }

  void _onUnsaved(HotEvent event) {
    setState(() => _processingEventId = event.id);
    BlocProvider.of<SaveContentBloc>(context).add(
      SaveContentSaved(
        saveContentParams: SaveContentParams(
          saveContent: SaveContentEnum.events,
          id: event.id,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<SavedEventsListBloc>(context).add(
      const SavedEventsListLoaded(queryPageParams: QueryPageParams(page: 1)),
    );
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return _refreshCompleter!.future;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocListener<SaveContentBloc, SaveContentState>(
      listenWhen: (previous, current) => current is SaveContentSuccess,
      listener: (context, state) {
        if (state is SaveContentSuccess) {
          setState(() {
            _events.removeWhere((e) => e.id == state.id);
            _processingEventId = null;
          });
          AppMessenger.showSuccess(context, state.message);
        }
      },
      child: BlocConsumer<SavedEventsListBloc, SavedEventsListState>(
        listenWhen: (previous, current) =>
            current is SavedEventsListLoadSuccess ||
            current is SavedEventsListLoadFailure,
        listener: (context, state) {
          if (state is SavedEventsListLoadSuccess) {
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
          } else if (state is SavedEventsListLoadFailure) {
            if (!_hasLoadedOnce) {
              setState(() {
                _errorMessage = state.error;
                _processingEventId = null;
              });
            } else {
              setState(() => _processingEventId = null);
              AppMessenger.showError(context, state.error);
            }
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is SavedEventsListLoadInProgress && _hasLoadedOnce) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (!_hasLoadedOnce && state is SavedEventsListLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!_hasLoadedOnce && _errorMessage != null) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<SavedEventsListBloc>(context).add(
                  const SavedEventsListLoaded(
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

            final hasMore =
                state is SavedEventsListLoadSuccess && state.hasMore;
            final itemCount = hasMore ? _events.length + 1 : _events.length;

            return RefreshIndicator.adaptive(
              displacement: 10,
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
                    child: SaveHotEventContentDismissible(
                      hotEvent: event,
                      isProcessing: _processingEventId == event.id,
                      onUnsavedConfirm: () => _onUnsaved(event),
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
      ),
    );
  }
}
