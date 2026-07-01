import 'package:flutter/material.dart';
import 'package:kianja/core/utils/extensions.dart';

class JobOffersFilterScreen extends StatelessWidget {
  const JobOffersFilterScreen({
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
        child: children.isNotEmpty
            ? Column(children: children)
            : Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(context.appLoc.no_job_offers_yet),
                ),
              ),
      ),
    );
  }
}
