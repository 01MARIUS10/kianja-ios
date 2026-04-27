import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';

class Kara3DProgressIndicator extends StatefulWidget {
  const Kara3DProgressIndicator({super.key, this.size = 60.0});
  final double size;

  @override
  State<Kara3DProgressIndicator> createState() =>
      _Kara3DProgressIndicatorState();
}

class _Kara3DProgressIndicatorState extends State<Kara3DProgressIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(_controller.value * 2 * math.pi), // 3D Y-axis rotation
            child: child,
          );
        },
        child: Image.asset(
          Assets.kara,
          width: widget.size,
          height: widget.size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
