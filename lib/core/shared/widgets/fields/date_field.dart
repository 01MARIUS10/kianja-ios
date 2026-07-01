import 'package:flutter/material.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/extensions.dart';

class DateField extends StatefulWidget {
  const DateField({super.key, required this.dateController});
  final TextEditingController dateController;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  @override
  Widget build(BuildContext context) {
    return TextInputField(
      controller: widget.dateController,
      hintText: context.appLoc.select_date,
      readOnly: true,
      onTap: _selectDate,
      prefixIcon: const Icon(
        Icons.calendar_today_outlined,
        color: AppColors.icon,
        size: 20,
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        widget.dateController.text = '${picked.toLocal()}'.split(' ')[0];
        // widget.dateController.text = picked.year.toString();
        AppDebug.showPrint('Selected date: ${widget.dateController.text}');
      });
    }
  }
}
