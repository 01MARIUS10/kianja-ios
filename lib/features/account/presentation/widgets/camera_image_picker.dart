import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

class CameraImagePicker extends StatefulWidget {
  const CameraImagePicker({super.key, required this.onImagePicked});
  final void Function(File?) onImagePicked;

  @override
  State<CameraImagePicker> createState() => _CameraImagePickerState();
}

class _CameraImagePickerState extends State<CameraImagePicker> {
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () => _showPhotoOptions(context),
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
            shape: BoxShape.circle,
            border: Border.all(
              color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              width: 2,
            ),
          ),
          child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
        ),
      ),
    );
  }

  // ── Photo picker ──────────────────────────────────────────────────
  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 600,
    );
    if (file != null) {
      setState(() {
        _pickedImage = File(file.path);
        widget.onImagePicked(_pickedImage);
      });
    }
  }

  void _showPhotoOptions(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useRootNavigator: true,
      backgroundColor: isDark
          ? AppColors.darkSurface
          : AppColors.lightBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Constants.borderRadiusMedium),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library_outlined),
                title: Text(
                  context.appLoc.choose_gallery,
                  style: theme.textTheme.bodyLarge,
                ),
                onTap: () {
                  context.pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: Text(
                  context.appLoc.take_photo,
                  style: theme.textTheme.bodyLarge,
                ),
                onTap: () {
                  context.pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              if (_pickedImage != null)
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: AppColors.danger,
                  ),
                  title: Text(
                    context.appLoc.remove_photo,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: AppColors.danger,
                    ),
                  ),
                  onTap: () {
                    context.pop();
                    setState(() {
                      _pickedImage = null;
                      widget.onImagePicked(_pickedImage);
                    });
                  },
                ),
              const SizedBox(height: Constants.spacingSmall),
            ],
          ),
        );
      },
    );
  }
}
