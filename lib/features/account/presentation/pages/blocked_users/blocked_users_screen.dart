import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_params.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/blocked_user_item_list.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';

class BlockedUsersScreen extends StatefulWidget {
  const BlockedUsersScreen({super.key});

  @override
  State<BlockedUsersScreen> createState() => _BlockedUsersScreenState();
}

class _BlockedUsersScreenState extends State<BlockedUsersScreen> {
  final ScrollController _scrollController = ScrollController();

  List<User> _candidates = [];
  bool _hasLoadedOnce = false;
  String? _errorMessage;
  Completer<void>? _refreshCompleter;
  AccountBloc? _myAccountBloc;
  int? _unblockingUserId;

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

    final bloc = _myAccountBloc;
    if (bloc == null) return;

    final state = bloc.state;
    if (state is AccountBlockedUsersSuccess &&
        state.hasMore &&
        !state.isLoadMore) {
      bloc.add(const AccountBlockedUsersLoadMoreRequested());
    }
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    final bloc = _myAccountBloc;
    if (bloc == null) return _refreshCompleter?.future ?? Future.value();

    _refreshCompleter = Completer<void>();
    bloc.add(
      const AccountBlockedUsersRequested(
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
    return BlocProvider(
      create: (_) {
        _myAccountBloc = GetIt.instance<AccountBloc>()
          ..add(
            const AccountBlockedUsersRequested(
              queryPageParams: QueryPageParams(page: 1),
            ),
          );
        return _myAccountBloc!;
      },
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.blocked_users),
        child: BlocConsumer<AccountBloc, AccountState>(
          listenWhen: (previous, current) =>
              current is AccountBlockedUsersSuccess ||
              current is AccountUnblockUserSuccess ||
              current is AccountRequestFailure,
          listener: (context, state) {
            if (state is AccountBlockedUsersSuccess) {
              setState(() {
                _candidates = state.users;
                _unblockingUserId = state.unblockingUserId;
                _hasLoadedOnce = true;
                _errorMessage = null;
              });
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            } else if (state is AccountUnblockUserSuccess) {
              AppMessenger.showSuccess(
                context,
                context.appLoc.unblocked_user_successfully,
              );
            } else if (state is AccountRequestFailure) {
              if (!_hasLoadedOnce) {
                setState(() => _errorMessage = state.message);
              } else {
                AppMessenger.showError(context, state.message);
              }
              if (_refreshCompleter != null) {
                _refreshCompleter?.complete();
                _refreshCompleter = null;
              }
            }
          },
          buildWhen: (previous, current) {
            if (current is AccountRequestInProgress && _hasLoadedOnce) {
              return false;
            }
            // Don't rebuild on AccountUnblockUserSuccess since list is
            // already updated via the AccountBlockedUsersSuccess emitted before it.
            if (current is AccountUnblockUserSuccess) {
              return false;
            }
            return true;
          },
          builder: (context, state) {
            if (!_hasLoadedOnce && state is AccountRequestInProgress) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!_hasLoadedOnce && _errorMessage != null) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<AccountBloc>(context).add(
                    const AccountBlockedUsersRequested(
                      queryPageParams: QueryPageParams(page: 1),
                    ),
                  );
                },
                message: _errorMessage!,
              );
            }

            if (_hasLoadedOnce) {
              if (_candidates.isEmpty) {
                return Center(child: Text(context.appLoc.no_blocked_user));
              }

              final hasMore =
                  state is AccountBlockedUsersSuccess && state.hasMore;
              final itemCount = hasMore
                  ? _candidates.length + 1
                  : _candidates.length;

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
                    if (hasMore && index >= _candidates.length) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Constants.paddingMedium,
                        ),
                        child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    }

                    final candidate = _candidates[index];
                    AppDebug.showPrint(
                      'Blocked User: ${candidate.firstName} ${candidate.lastName} (ID: ${candidate.id})',
                    );
                    return BlockedUserItemList(
                      user: candidate,
                      isUnblocking: _unblockingUserId == candidate.id,
                      onUnblock: () {
                        BlocProvider.of<AccountBloc>(context).add(
                          AccountUnblockUserRequested(
                            unblockUserParams: UnblockUserParams(
                              id: candidate.id,
                            ),
                          ),
                        );
                      },
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
      ),
    );
  }
}
