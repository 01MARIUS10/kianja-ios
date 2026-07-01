import 'package:flutter/material.dart';
import 'package:kianja/core/utils/extensions.dart';

class JobApplicantFilterScreen extends StatelessWidget {
  const JobApplicantFilterScreen({
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
                child: Text(
                  context.appLoc.no_job_applicants_yet,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
      ),
    );
  }
}
