import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class ResidenceField extends StatefulWidget {
  const ResidenceField({super.key, required this.residenceController});
  final TextEditingController residenceController;

  @override
  State<ResidenceField> createState() => _ResidenceFieldState();
}

class _ResidenceFieldState extends State<ResidenceField> {
  final List<String> _residences = [
    'Antananarivo',
    'Antsiranana',
    'Fianarantsoa',
    'Mahajanga',
    'Toamasina',
    'Toliara',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LabelField(label: 'RESIDENCE'),
        const SizedBox(height: Constants.spacingSmall),
        TextInputField(
          controller: widget.residenceController,
          hintText: 'select a residence',
          readOnly: true,
          onTap: _showResidencePicker,
          suffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.icon,
          ),
        ),
      ],
    );
  }

  void _showResidencePicker() {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _residences.map((residence) {
              return ListTile(
                title: Text(residence),
                onTap: () {
                  setState(() => widget.residenceController.text = residence);
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
