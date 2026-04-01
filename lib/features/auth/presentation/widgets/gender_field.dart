import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class GenderField extends StatefulWidget {
  const GenderField({super.key, required this.genderController});
  final TextEditingController genderController;

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  final List<String> _genders = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabelField(label: 'GENDER'),
        const SizedBox(height: Constants.spacingSmall),
        TextInputField(
          controller: widget.genderController,
          hintText: 'select a gender',
          readOnly: true,
          onTap: _showGenderPicker,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.icon,
          ),
        ),
      ],
    );
  }

  void _showGenderPicker() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _genders.map((gender) {
              return ListTile(
                title: Text(gender),
                onTap: () {
                  setState(() => widget.genderController.text = gender);
                  context.pop();
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
