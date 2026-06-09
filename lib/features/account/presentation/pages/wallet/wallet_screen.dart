import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/kara_history_dismissible.dart';
import 'package:kianja/features/account/presentation/widgets/wallet_balance_card.dart';
import 'package:kianja/features/my_post/presentation/widgets/my_post_refresh_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>(),
      child: const _WalletScreenBody(),
    );
  }
}

class _WalletScreenBody extends StatefulWidget {
  const _WalletScreenBody();

  @override
  State<_WalletScreenBody> createState() => _WalletScreenBodyState();
}

class _WalletScreenBodyState extends State<_WalletScreenBody> {
  final ScrollController _scrollController = ScrollController();

  List<KaraHistory> _history = [];
  int _karaCount = 0;
  bool _hasLoadedOnce = false;
  bool _hasMore = false;
  String? _errorMessage;
  Completer<void>? _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    final bloc = BlocProvider.of<AccountBloc>(context);
    final state = bloc.state;

    if (state is AccountKaraSuccess) {
      _karaCount = state.kara;
    } else {
      bloc.add(const AccountKaraRequested());
    }

    if (state is AccountWalletHistorySuccess) {
      _history = state.history;
      _hasMore = state.hasMore;
      _hasLoadedOnce = true;
    } else {
      bloc.add(
        const AccountWalletHistoryRequested(
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

    final state = BlocProvider.of<AccountBloc>(context).state;
    if (state is! AccountWalletHistorySuccess || state.isLoadMore) return;
    if (!_hasMore) return;

    BlocProvider.of<AccountBloc>(
      context,
    ).add(const AccountWalletLoadMoreRequested());
  }

  Future<void> _refresh() async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<void>();
    BlocProvider.of<AccountBloc>(context)
      ..add(const AccountKaraRequested())
      ..add(
        const AccountWalletHistoryRequested(
          queryPageParams: QueryPageParams(page: 1),
        ),
      );
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0);
    }

    return _refreshCompleter!.future;
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Constants.paddingMedium,
            horizontal: Constants.paddingMedium,
          ),
          child: WalletBalanceCard(
            balance: AppFunction.formatNumberWithSpaces(_karaCount),
            onTransfer: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
            vertical: Constants.paddingSmall,
          ),
          child: Text(
            context.appLoc.kara_usage_history,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(
          height: 1,
          indent: Constants.paddingMedium,
          endIndent: Constants.paddingMedium,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const TitleHeader(title: 'Kara'),
      child: BlocConsumer<AccountBloc, AccountState>(
        listenWhen: (previous, current) =>
            current is AccountWalletHistorySuccess ||
            current is AccountKaraSuccess ||
            current is AccountRequestFailure,
        listener: (context, state) {
          if (state is AccountKaraSuccess) {
            setState(() => _karaCount = state.kara);
          } else if (state is AccountWalletHistorySuccess) {
            setState(() {
              _history = state.history;
              _hasMore = state.hasMore;
              _hasLoadedOnce = true;
              _errorMessage = null;
            });
            if (_refreshCompleter != null) {
              _refreshCompleter?.complete();
              _refreshCompleter = null;
            }
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
          return true;
        },
        builder: (context, state) {
          if (!_hasLoadedOnce && state is AccountRequestInProgress) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!_hasLoadedOnce && _errorMessage != null) {
            return ServerFailureScreen(
              onRetry: () {
                BlocProvider.of<AccountBloc>(context)
                  ..add(const AccountKaraRequested())
                  ..add(
                    const AccountWalletHistoryRequested(
                      queryPageParams: QueryPageParams(page: 1),
                    ),
                  );
              },
              message: _errorMessage!,
            );
          }

          if (_hasLoadedOnce) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                Expanded(
                  child: _history.isEmpty
                      ? MyPostRefreshScreen(
                          onRefresh: _refresh,
                          child: ListView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            children: [
                              const SizedBox(height: 120),
                              Center(
                                child: Text(context.appLoc.no_kara_history_yet),
                              ),
                            ],
                          ),
                        )
                      : MyPostRefreshScreen(
                          onRefresh: _refresh,
                          child: ListView.separated(
                            controller: _scrollController,
                            physics: const AlwaysScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(
                              bottom: Constants.paddingMedium,
                            ),
                            itemCount: _hasMore
                                ? _history.length + 1
                                : _history.length,
                            itemBuilder: (context, index) {
                              if (_hasMore && index >= _history.length) {
                                return const Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: Constants.paddingMedium,
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  ),
                                );
                              }

                              return KaraHistoryDismissible(
                                history: _history[index],
                                onDeleteConfirmed: () {},
                              );
                            },
                            separatorBuilder: (context, index) {
                              if (_hasMore && index >= _history.length - 1) {
                                return const SizedBox.shrink();
                              }
                              return const Divider(
                                indent: Constants.paddingMedium,
                                endIndent: Constants.paddingMedium,
                              );
                            },
                          ),
                        ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
