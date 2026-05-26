import 'package:flutter/material.dart';
import 'package:kianja/features/account/presentation/pages/wallet/widgets/wallet_header.dart';
import 'package:kianja/features/account/presentation/pages/wallet/widgets/wallet_tabs_delegate.dart';
import 'package:kianja/features/account/presentation/pages/wallet/widgets/wallet_transaction_list.dart';

class WalletContent extends StatelessWidget {
  const WalletContent({super.key});

  static const List<String> _tabs = [
    'All',
    'Earnings',
    'Expenses',
    'Transfers',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: _tabs.length,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverPersistentHeader(
            pinned: true,
            delegate: WalletHeaderDelegate(
              maxExtent: 260,
              minExtent: 112,
              availableBalance: '100 000',
              balanceLabel: 'Available balance',
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Lists of operations',
                style: theme.textTheme.headlineSmall,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: WalletTabBarHeaderDelegate(
              child: Container(
                color: theme.scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Material(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(18),
                  child: TabBar(
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                    indicator: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(999),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: theme.textTheme.bodyMedium?.color,
                    tabs: _tabs.map((title) => Tab(text: title)).toList(),
                  ),
                ),
              ),
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: true,
            child: TabBarView(
              children: [
                WalletTransactionList(filter: WalletTransactionFilter.all),
                WalletTransactionList(filter: WalletTransactionFilter.earnings),
                WalletTransactionList(filter: WalletTransactionFilter.expenses),
                WalletTransactionList(
                  filter: WalletTransactionFilter.transfers,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
