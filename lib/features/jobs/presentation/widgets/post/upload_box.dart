import 'package:flutter/material.dart';

class UploadBox extends StatelessWidget {
  const UploadBox({
    super.key,
    required this.text,
    this.icon,
    this.buttonText,
    required this.onTap,
  });

  final String text;
  final IconData? icon;
  final String? buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.dividerTheme.color ?? Colors.grey.shade400;

    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedRectPainter(color: borderColor),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              if (icon != null) ...[
                const SizedBox(height: 16),
                Icon(icon, size: 48, color: theme.colorScheme.primary),
              ],
              if (buttonText != null) ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(buttonText!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedRectPainter extends CustomPainter {
  _DashedRectPainter({required this.color});
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const dashWidth = 8.0;
    const dashSpace = 6.0;

    // Top
    for (double i = 0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(i, 0),
        Offset((i + dashWidth).clamp(0.0, size.width), 0),
        paint,
      );
    }
    // Bottom
    for (double i = 0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(i, size.height),
        Offset((i + dashWidth).clamp(0.0, size.width), size.height),
        paint,
      );
    }
    // Left
    for (double i = 0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(0, i),
        Offset(0, (i + dashWidth).clamp(0.0, size.height)),
        paint,
      );
    }
    // Right
    for (double i = 0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(size.width, i),
        Offset(size.width, (i + dashWidth).clamp(0.0, size.height)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRectPainter oldDelegate) =>
      oldDelegate.color != color;
}
