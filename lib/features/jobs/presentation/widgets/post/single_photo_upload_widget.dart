import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/themes/app_colors.dart';

class SinglePhotoUploadWidget extends StatefulWidget {
  const SinglePhotoUploadWidget({
    super.key,
    required this.onPhotoChanged,
    this.initialNetworkImageUrl,
  });

  final ValueChanged<XFile?> onPhotoChanged;
  final String? initialNetworkImageUrl;

  @override
  State<SinglePhotoUploadWidget> createState() =>
      _SinglePhotoUploadWidgetState();
}

class _SinglePhotoUploadWidgetState extends State<SinglePhotoUploadWidget> {
  XFile? _photo;
  bool _networkImageRemoved = false;
  final ImagePicker _picker = ImagePicker();

  String? get _networkImageUrl {
    if (_networkImageRemoved || widget.initialNetworkImageUrl == null) {
      return null;
    }
    final path = widget.initialNetworkImageUrl!;
    if (path.startsWith('http')) return path;
    return '${EnvConfig.baseApiUrl}$path';
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _photo = pickedFile;
      });
      widget.onPhotoChanged(_photo);
    }
  }

  void _removePhoto() {
    setState(() {
      _photo = null;
      _networkImageRemoved = true;
    });
    widget.onPhotoChanged(null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Using Row with MainAxisSize.min so that it only occupies needed width
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 8),
          child: _photo != null
              ? _buildPhotoItem(theme)
              : _networkImageUrl != null
              ? _buildNetworkPhotoItem(theme)
              : _buildAddPhotoButton(theme),
        ),
      ],
    );
  }

  Widget _buildNetworkPhotoItem(ThemeData theme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 80,
            height: 80,
            child: CachedNetworkImage(
              imageUrl: _networkImageUrl!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => _buildAddPhotoButton(theme),
            ),
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: GestureDetector(
            onTap: _removePhoto,
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

  Widget _buildPhotoItem(ThemeData theme) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: FileImage(File(_photo!.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: -8,
          right: -8,
          child: GestureDetector(
            onTap: _removePhoto,
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

  Widget _buildAddPhotoButton(ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: _pickImage,
      child: CustomPaint(
        painter: _DashedRoundedRectPainter(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
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
