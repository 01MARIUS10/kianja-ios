import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_duration.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_type.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';

class PostFeaturesExpertExecutive extends StatefulWidget {
  const PostFeaturesExpertExecutive({
    super.key,
    required this.plans,
    required this.onPlanSelected,
    this.onSubscribe,
    this.isLoading = false,
    this.subscribeButtonLabel,
  });

  final List<PricePlan> plans;
  final ValueChanged<PricePlan?> onPlanSelected;
  final VoidCallback? onSubscribe;
  final bool isLoading;
  final String? subscribeButtonLabel;

  @override
  State<PostFeaturesExpertExecutive> createState() =>
      _PostFeaturesExpertExecutiveState();
}

class _PostFeaturesExpertExecutiveState
    extends State<PostFeaturesExpertExecutive> {
  JobType? _selectedType;
  JobDuration? _selectedDuration;
  PricePlan? _selectedPlan;

  @override
  void initState() {
    super.initState();
    if (widget.plans.isNotEmpty) {
      _selectedType = widget.plans.first.type;
      _updateDurationsForSelectedType();
    }
  }

  @override
  void didUpdateWidget(covariant PostFeaturesExpertExecutive oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.plans != oldWidget.plans) {
      if (widget.plans.isNotEmpty && _selectedType == null) {
        _selectedType = widget.plans.first.type;
        _updateDurationsForSelectedType();
      }
    }
  }

  void _updateDurationsForSelectedType() {
    if (_selectedType == null) return;
    final availablePlansForType = widget.plans
        .where((p) => p.type.id == _selectedType!.id)
        .toList();
    if (availablePlansForType.isNotEmpty) {
      _selectedDuration = availablePlansForType.first.duration;
      _selectedPlan = availablePlansForType.first;
    } else {
      _selectedDuration = null;
      _selectedPlan = null;
    }
    widget.onPlanSelected(_selectedPlan);
  }

  void _toggleType(JobType type) {
    if (_selectedType?.id == type.id) return;
    setState(() {
      _selectedType = type;
      _updateDurationsForSelectedType();
    });
  }

  void _toggleDuration(JobDuration duration) {
    if (_selectedDuration?.id == duration.id) return;
    setState(() {
      _selectedDuration = duration;
      try {
        _selectedPlan = widget.plans.firstWhere(
          (p) => p.type.id == _selectedType!.id && p.duration.id == duration.id,
        );
      } catch (e) {
        _selectedPlan = null;
      }
      widget.onPlanSelected(_selectedPlan);
    });
  }

  List<JobType> get _distinctTypes {
    final types = <int, JobType>{};
    for (final plan in widget.plans) {
      types[plan.type.id] = plan.type;
    }
    return types.values.toList();
  }

  List<JobDuration> get _availableDurations {
    if (_selectedType == null) return [];
    final durations = <int, JobDuration>{};
    for (final plan in widget.plans) {
      if (plan.type.id == _selectedType!.id) {
        durations[plan.duration.id] = plan.duration;
      }
    }
    return durations.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    if (widget.plans.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLoc.subscription_needs,
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildFeatureRow(
          context,
          label: '${context.appLoc.type} :',
          children: _distinctTypes.map((type) {
            final isSelected = _selectedType?.id == type.id;
            return InkWell(
              onTap: () => _toggleType(type),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (value) => _toggleType(type),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(type.name, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        _buildFeatureRow(
          context,
          label: '${context.appLoc.duration} :',
          children: _availableDurations.map((duration) {
            final isSelected = _selectedDuration?.id == duration.id;
            return InkWell(
              onTap: () => _toggleDuration(duration),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: isSelected,
                        onChanged: (value) => _toggleDuration(duration),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(duration.duration, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text('${context.appLoc.price} : ', style: textTheme.bodyMedium),
            const SizedBox(width: 8),
            Image.asset(
              Assets.kara,
              cacheHeight: Constants.size70.toInt(),
              cacheWidth: Constants.size70.toInt(),
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 4),
            Text(
              _selectedPlan != null
                  ? AppFunction.formatNumberWithSpaces(_selectedPlan!.price)
                  : '-',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onSubscribe,
            child: widget.isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    widget.subscribeButtonLabel ?? context.appLoc.subscribe,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureRow(
    BuildContext context, {
    required String label,
    required List<Widget> children,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}
