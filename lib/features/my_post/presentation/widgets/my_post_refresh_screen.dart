import 'package:flutter/material.dart';

class MyPostRefreshScreen extends StatelessWidget {
  const MyPostRefreshScreen({super.key, required this.child, this.onRefresh});
  final Widget child;
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      displacement: 10,
      onRefresh: onRefresh ?? () async {},
      child: child,
    );
  }
}
