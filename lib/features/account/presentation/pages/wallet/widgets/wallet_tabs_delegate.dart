import 'package:flutter/material.dart';

class WalletTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  const WalletTabBarHeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 74;

  @override
  double get maxExtent => 74;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox(
      height: maxExtent,
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: child,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant WalletTabBarHeaderDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
