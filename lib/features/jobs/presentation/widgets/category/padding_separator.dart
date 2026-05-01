import 'package:flutter/material.dart';
import 'package:kianja/core/utils/constants.dart';

class PaddingSeparator extends StatelessWidget {
  const PaddingSeparator({
    super.key,
    required this.index,
    required this.itemCount,
    this.child,
  });
  final int index;
  final int itemCount;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: index < itemCount - 1 ? Constants.spacingSmall : 0,
      ),
      child: child,
    );
  }
}
