import 'package:flutter/material.dart';

class TrainingCenterFilterScreen extends StatelessWidget {
  const TrainingCenterFilterScreen({
    super.key,
    required this.children,
    this.onRefresh,
  });
  final List<Widget> children;
  final RefreshCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      displacement: 10,
      onRefresh: onRefresh ?? () async {},
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(children: children),
      ),
    );
  }
}
