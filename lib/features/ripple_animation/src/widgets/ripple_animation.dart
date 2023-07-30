import 'package:flutter/material.dart';

import '../../widgets.dart';

class RippleAnimation extends StatefulWidget {
  const RippleAnimation({
    Key? key,
    this.color = Colors.blue,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RipplePainter(
        _animationController,
        color: widget.color,
      ),
      child: SizedBox(
        child: Center(
          child: widget.child,
        ),
      ),
    );
  }
}
