import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';

class BirthDateField extends StatefulWidget {
  const BirthDateField({super.key, required this.birthDateController});
  final TextEditingController birthDateController;

  @override
  State<BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LabelField(label: 'BIRTH DATE'),
        const SizedBox(height: Constants.spacingSmall),
        TextInputField(
          controller: widget.birthDateController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          hintText: 'Select date',
          readOnly: true,
          onTap: _selectDate,
          prefixIcon: const Icon(
            Icons.calendar_today_outlined,
            color: AppColors.icon,
            size: 20,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a birth date';
            }
            final birthDate = DateTime.parse(value);
            final today = DateTime.now();
            int age = today.year - birthDate.year;
            // Subtract a year if the birthday hasn't occurred yet this year
            if (today.month < birthDate.month ||
                (today.month == birthDate.month && today.day < birthDate.day)) {
              age--;
            }
            if (age < 18) {
              return 'You must be at least 18 years old';
            }
            return null;
          },
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        widget.birthDateController.text = '${picked.toLocal()}'.split(' ')[0];
        // widget.birthDateController.text = picked.year.toString();
        AppDebug.showPrint('Selected date: ${widget.birthDateController.text}');
      });
    }
  }
}
