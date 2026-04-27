import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';

class BounceIndicator extends StatefulWidget {
  const BounceIndicator({super.key, this.size = 60.0});
  final double size;

  @override
  State<BounceIndicator> createState() => _BounceIndicatorState();
}

class _BounceIndicatorState extends State<BounceIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );

    _animation = Tween<double>(begin: 0, end: -15).animate(curvedAnimation);

    // Scale from 0.8 (at the bottom) to 1.0 (at the top)
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 2,
    ).animate(curvedAnimation);
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
          return Transform.translate(
            offset: Offset(0, _animation.value),
            child: Transform.scale(scale: _scaleAnimation.value, child: child),
          );
        },
        child: Image.asset(
          Assets.logoKianja,
          width: widget.size,
          height: widget.size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
