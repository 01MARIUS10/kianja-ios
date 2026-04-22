import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class PostFeaturesSection extends StatefulWidget {
  const PostFeaturesSection({super.key});

  @override
  State<PostFeaturesSection> createState() => _PostFeaturesSectionState();
}

class _PostFeaturesSectionState extends State<PostFeaturesSection> {
  final List<String> _selectedTypes = ['General'];
  final List<String> _selectedDurations = ['1 week'];

  void _toggleType(String type) {
    setState(() {
      if (_selectedTypes.contains(type)) {
        _selectedTypes.remove(type);
      } else {
        _selectedTypes.clear();
        _selectedTypes.add(type);
      }
    });
  }

  void _toggleDuration(String duration) {
    setState(() {
      if (_selectedDurations.contains(duration)) {
        _selectedDurations.remove(duration);
      } else {
        _selectedDurations.clear();
        _selectedDurations.add(duration);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Post features',
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        _buildFeatureRow(
          context,
          label: 'Type :',
          children: ['General', 'Immediate'].map((type) {
            final isSelected = _selectedTypes.contains(type);
            return InkWell(
              onTap: () => _toggleType(type),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
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
                    Text(type, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        _buildFeatureRow(
          context,
          label: 'Duration :',
          children: ['1 week', '1 month', '3 months'].map((duration) {
            final isSelected = _selectedDurations.contains(duration);
            return InkWell(
              onTap: () => _toggleDuration(duration),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  // mainAxisSize: MainAxisSize.min,
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
                    Text(duration, style: textTheme.bodyMedium),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Text('Price : ', style: textTheme.bodyMedium),
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
              '5 000',
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
            onPressed: () {},
            child: Text(
              'POST',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
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
            padding: const EdgeInsets.only(top: 4.0),
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
