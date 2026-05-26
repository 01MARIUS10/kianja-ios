import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';

enum WalletTransactionFilter { all, earnings, expenses, transfers }

class WalletTransaction {
  const WalletTransaction({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.amount,
    required this.filter,
  });

  final String title;
  final String subtitle;
  final String date;
  final String amount;
  final WalletTransactionFilter filter;
}

class WalletTransactionList extends StatelessWidget {
  const WalletTransactionList({super.key, required this.filter});

  final WalletTransactionFilter filter;

  static const List<WalletTransaction> _transactions = [
    WalletTransaction(
      title: 'Daily connection',
      subtitle: 'Bonus',
      date: '12 January 2026 19:37',
      amount: '+500',
      filter: WalletTransactionFilter.earnings,
    ),
    WalletTransaction(
      title: 'Posting job',
      subtitle: 'Job in general price',
      date: '12 January 2026 19:37',
      amount: '-5000',
      filter: WalletTransactionFilter.expenses,
    ),
    WalletTransaction(
      title: 'Daily connection',
      subtitle: 'Bonus',
      date: '11 January 2026 19:37',
      amount: '+500',
      filter: WalletTransactionFilter.earnings,
    ),
    WalletTransaction(
      title: 'Transfer received',
      subtitle: 'From friend',
      date: '10 January 2026 15:12',
      amount: '+1 200',
      filter: WalletTransactionFilter.transfers,
    ),
    WalletTransaction(
      title: 'Transfer sent',
      subtitle: 'Payment for service',
      date: '09 January 2026 09:44',
      amount: '-1 200',
      filter: WalletTransactionFilter.transfers,
    ),
  ];

  List<WalletTransaction> get _filteredTransactions {
    if (filter == WalletTransactionFilter.all) {
      return _transactions;
    }
    return _transactions.where((item) => item.filter == filter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final data = _filteredTransactions;

    if (data.isEmpty) {
      return Center(
        child: Text(
          'No operations to show yet.',
          style: theme.textTheme.bodyMedium,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 24),
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final transaction = data[index];
        return _WalletTransactionItem(transaction: transaction);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}

class _WalletTransactionItem extends StatelessWidget {
  const _WalletTransactionItem({required this.transaction});

  final WalletTransaction transaction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = transaction.amount.startsWith('+');
    final amountColor = isPositive ? AppColors.success : AppColors.danger;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: theme.dividerColor),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(transaction.subtitle, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(transaction.date, style: theme.textTheme.bodySmall),
              const SizedBox(height: 10),
              Text(
                transaction.amount,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
