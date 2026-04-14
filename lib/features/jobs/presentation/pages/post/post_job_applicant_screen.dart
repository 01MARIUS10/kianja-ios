import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_header.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/upload_box.dart';

class PostJobApplicantScreen extends StatefulWidget {
  const PostJobApplicantScreen({super.key});

  @override
  State<PostJobApplicantScreen> createState() => _PostJobApplicantScreenState();
}

class _PostJobApplicantScreenState extends State<PostJobApplicantScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();
  final List<String> _selectedCategories = ['Designer'];
  final List<String> _selectedLocations = ['National'];
  final List<String> _selectedGenders = ['Female'];

  void _toggleCategory(String category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        if (_selectedCategories.length < 3) {
          _selectedCategories.add(category);
        }
      }
    });
  }

  void _toggleLocation(String location) {
    setState(() {
      if (_selectedLocations.contains(location)) {
        _selectedLocations.remove(location);
      } else {
        _selectedLocations.clear();
        _selectedLocations.add(location);
      }
    });
  }

  void _toggleGender(String gender) {
    setState(() {
      if (_selectedGenders.contains(gender)) {
        _selectedGenders.remove(gender);
      } else {
        _selectedGenders.clear();
        _selectedGenders.add(gender);
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: const PostHeader(title: 'Post a job applicant'),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.paddingMedium,
            vertical: Constants.paddingMedium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelField(label: 'Job title *'),
              const SizedBox(height: Constants.spacingSmall),
              TextInputField(
                controller: _titleController,
                hintText: 'Add job title',
                maxLines: 3,
                maxLength: 130,
              ),
              const SizedBox(height: Constants.spacingMedium),

              const LabelField(label: 'Motivation *'),
              const SizedBox(height: Constants.spacingSmall),
              TextInputField(
                controller: _motivationController,
                hintText: 'Add motivation',
                maxLines: 10,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: Constants.spacingMedium),

              const LabelField(label: 'Recent photo (optional)'),
              const SizedBox(height: Constants.spacingSmall),
              UploadBox(
                text: 'Upload your recent photo\nIn jpg/jpeg/png format.',
                icon: Icons.camera_alt_outlined,
                onTap: () {},
              ),
              const SizedBox(height: Constants.spacingMedium),

              const LabelField(label: 'Resume (optional)'),
              const SizedBox(height: Constants.spacingSmall),
              UploadBox(
                text:
                    'Upload your Resume and\nlet members look at it.\nIn PDF format.',
                buttonText: 'Upload',
                onTap: () {},
              ),
              const SizedBox(height: Constants.spacingMedium),

              Row(
                children: [
                  Text(
                    'Category * ',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(3 max)',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white54 : Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Constants.spacingSmall),
              Wrap(
                spacing: Constants.spacingMedium,
                children: ['Designer', 'Coder', 'Driver', 'Teacher'].map((
                  category,
                ) {
                  final isSelected = _selectedCategories.contains(category);
                  return InkWell(
                    onTap: () => _toggleCategory(category),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (value) => _toggleCategory(category),
                            ),
                          ),
                          const SizedBox(width: Constants.spacingExtraSmall),
                          Text(category, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Constants.spacingMedium),

              const LabelField(label: 'Location *'),
              const SizedBox(height: Constants.spacingSmall),
              Wrap(
                spacing: Constants.spacingMedium,
                children: ['National', 'Antananarivo', 'Toliara'].map((
                  location,
                ) {
                  final isSelected = _selectedLocations.contains(location);
                  return InkWell(
                    onTap: () => _toggleLocation(location),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (value) => _toggleLocation(location),
                            ),
                          ),
                          const SizedBox(width: Constants.spacingExtraSmall),
                          Text(location, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: Constants.spacingMedium),

              const LabelField(label: 'Gender *'),
              const SizedBox(height: Constants.spacingSmall),
              Wrap(
                spacing: Constants.spacingMedium,

                children: ['Female', 'Male', 'Together'].map((gender) {
                  final isSelected = _selectedGenders.contains(gender);
                  return InkWell(
                    onTap: () => _toggleGender(gender),
                    borderRadius: BorderRadius.circular(4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: isSelected,
                              onChanged: (value) => _toggleGender(gender),
                            ),
                          ),
                          const SizedBox(width: Constants.spacingExtraSmall),
                          Text(gender, style: theme.textTheme.bodyMedium),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: Constants.spacingLarge),
              const Divider(),
              const SizedBox(height: Constants.spacingMedium),

              const PostFeaturesSection(),
              const SizedBox(height: Constants.spacingLarge),
            ],
          ),
        ),
      ),
    );
  }
}
