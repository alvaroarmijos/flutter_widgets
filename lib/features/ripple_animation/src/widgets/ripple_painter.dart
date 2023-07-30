import 'dart:math' as math show sqrt;

import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  RipplePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);

  final Color color;
  final Animation<double> _animation;

  void createCircle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color color = this.color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 0; wave < 4; wave++) {
      createCircle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) => true;
}
