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
import 'package:kianja/features/jobs/presentation/bloc/saved_hots_list/saved_hots_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/enum/save_content_enum.dart';
import 'package:kianja/features/jobs/presentation/widgets/save_hot_event_content_dismissible.dart';
import 'package:kianja/routing/routes.dart';

class SavedHotScreen extends StatefulWidget {
  const SavedHotScreen({super.key});

  @override
  State<SavedHotScreen> createState() => _SavedHotScreenState();
}

class _SavedHotScreenState extends State<SavedHotScreen>
    with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();

  List<HotEvent> _hots = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  int? _processingHotId;
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

    final state = BlocProvider.of<SavedHotsListBloc>(context).state;
    if (state is SavedHotsListLoadSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      BlocProvider.of<SavedHotsListBloc>(
        context,
      ).add(const SavedHotsListLoadMore());
    }
  }

  void _onTap(HotEvent hot) {
    context.pushNamed(
      Routes.trainingCenterHotEventDetail.name,
      pathParameters: {'id': hot.id.toString()},
      extra: {'category': hot.type.toUpperCase(), 'query': '/hots'},
    );
  }

  void _onUnsaved(HotEvent hot) {
    setState(() => _processingHotId = hot.id);
    BlocProvider.of<SaveContentBloc>(context).add(
      SaveContentSaved(
        saveContentParams: SaveContentParams(
          saveContent: SaveContentEnum.hots,
          id: hot.id,
        ),
      ),
    );
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<SavedHotsListBloc>(context).add(
      const SavedHotsListLoaded(queryPageParams: QueryPageParams(page: 1)),
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
            _hots.removeWhere((e) => e.id == state.id);
            _processingHotId = null;
          });
          AppMessenger.showSuccess(context, state.message);
        }
      },
      child: BlocConsumer<SavedHotsListBloc, SavedHotsListState>(
        listenWhen: (previous, current) =>
            current is SavedHotsListLoadSuccess ||
            current is SavedHotsListLoadFailure,
        listener: (context, state) {
          if (state is SavedHotsListLoadSuccess) {
            setState(() {
              _hots = state.hots;
              _hasLoadedOnce = true;
              _errorMessage = null;
              _processingHotId = null;
            });
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          } else if (state is SavedHotsListLoadFailure) {
            if (!_hasLoadedOnce) {
              setState(() {
                _errorMessage = state.error;
                _processingHotId = null;
              });
            } else {
              setState(() => _processingHotId = null);
              AppMessenger.showError(context, state.error);
            }
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
          }
        },
        buildWhen: (previous, current) {
          if (current is SavedHotsListLoadInProgress && _hasLoadedOnce) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (!_hasLoadedOnce && state is SavedHotsListLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!_hasLoadedOnce && _errorMessage != null) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<SavedHotsListBloc>(context).add(
                  const SavedHotsListLoaded(
                    queryPageParams: QueryPageParams(page: 1),
                  ),
                );
              },
              message: _errorMessage!,
            );
          }

          if (_hasLoadedOnce) {
            if (_hots.isEmpty) {
              return Center(child: Text(context.appLoc.no_hots_yet));
            }

            final hasMore =
                state is SavedHotsListLoadSuccess && state.hasMore;
            final itemCount = hasMore ? _hots.length + 1 : _hots.length;

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
                  if (hasMore && index >= _hots.length) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Constants.paddingMedium,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }

                  final hot = _hots[index];
                  return InkWell(
                    onTap: () => _onTap(hot),
                    child: SaveHotEventContentDismissible(
                      hotEvent: hot,
                      isProcessing: _processingHotId == hot.id,
                      onUnsavedConfirm: () => _onUnsaved(hot),
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
