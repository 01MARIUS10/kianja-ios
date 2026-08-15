import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

class MultiPhotoUploadWidget extends StatefulWidget {
  const MultiPhotoUploadWidget({
    super.key,
    this.maxPhotos = 5,
    this.hintText,
    required this.onPhotosChanged,
  });
  final int maxPhotos;
  final String? hintText;
  final ValueChanged<List<XFile>> onPhotosChanged;

  @override
  State<MultiPhotoUploadWidget> createState() => _MultiPhotoUploadWidgetState();
}

class _MultiPhotoUploadWidgetState extends State<MultiPhotoUploadWidget> {
  final List<XFile> _photos = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    if (_photos.length >= widget.maxPhotos) return;

    final pickedFiles = await _picker.pickMultiImage(imageQuality: 80);

    if (pickedFiles.isNotEmpty) {
      setState(() {
        for (var file in pickedFiles) {
          if (_photos.length < widget.maxPhotos) {
            _photos.add(file);
          }
        }
      });
      widget.onPhotosChanged(_photos);
    }
  }

  void _removePhoto(int index) {
    setState(() {
      _photos.removeAt(index);
    });
    widget.onPhotosChanged(_photos);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          // adding a bit of padding for overlapping badges
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                for (int i = 0; i < _photos.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: Constants.spacingMedium,
                    ),
                    child: _buildPhotoItem(i, _photos[i], theme),
                  ),
                if (_photos.length < widget.maxPhotos)
                  _buildAddPhotoButton(theme, _photos.isEmpty),
              ],
            ),
          ),
        ),
        const SizedBox(height: Constants.spacingMedium),
        Text(
          widget.hintText ?? context.appLoc.upload_5_photos,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoItem(int index, XFile photo, ThemeData theme) {
    final isDefault = index == 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(File(photo.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (isDefault)
          Positioned(top: -8, left: 8, child: _buildDefaultBadge(theme)),
        Positioned(
          top: -8,
          right: -8,
          child: GestureDetector(
            onTap: () => _removePhoto(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: theme.colorScheme.error,
                shape: BoxShape.circle,
                border: Border.all(
                  color: theme.scaffoldBackgroundColor,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddPhotoButton(ThemeData theme, bool isFirst) {
    return GestureDetector(
      onTap: _pickImages,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            painter: _DashedRoundedRectPainter(
              color: theme.dividerTheme.color ?? Colors.grey.shade400,
              radius: 12,
            ),
            child: Container(
              width: 80,
              height: 80,
              alignment: Alignment.center,
              child: Icon(
                Icons.add_a_photo_outlined,
                color: theme.colorScheme.primary,
                size: 28,
              ),
            ),
          ),
          if (isFirst)
            Positioned(top: -8, right: 8, child: _buildDefaultBadge(theme)),
        ],
      ),
    );
  }

  Widget _buildDefaultBadge(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        context.appLoc.default_value,
        style: theme.textTheme.labelSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _DashedRoundedRectPainter extends CustomPainter {
  _DashedRoundedRectPainter({required this.color, required this.radius});
  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(radius),
        ),
      );

    // To dash the path
    const dashLength = 6.0;
    const dashSpace = 4.0;

    final Path dashedPath = Path();
    for (PathMetric measurePath in path.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < measurePath.length) {
        final double length = draw ? dashLength : dashSpace;
        if (draw) {
          dashedPath.addPath(
            measurePath.extractPath(distance, distance + length),
            Offset.zero,
          );
        }
        distance += length;
        draw = !draw;
      }
    }
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant _DashedRoundedRectPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.radius != radius;
  }
}
