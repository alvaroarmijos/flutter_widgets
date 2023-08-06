import 'package:flutter/material.dart';

import '../../widgets.dart';

class SliderRing extends StatelessWidget {
  const SliderRing({
    super.key,
    required this.value,
    this.onChanged,
    this.min = 0.0,
    this.max = 1.0,
  });

  final double value;
  final double min;
  final double max;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: const RingSliderThumb(
          thumbRadius: 12,
        ),
        trackShape: CustomTrackShape(),
        trackHeight: 6,
        secondaryActiveTrackColor: const Color(0xFF04ccfb),
        thumbColor: const Color(0xFF454d75),
        activeTrackColor: const Color(0xFF454d75),
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        onChanged: onChanged,
      ),
    );
  }
}

class RingSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  const RingSliderThumb({
    required this.thumbRadius,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final primaryPathColor = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..style = PaintingStyle.fill;

    final accentPathColor = Paint()
      ..color = sliderTheme.secondaryActiveTrackColor ?? Colors.black
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    canvas.drawCircle(
        Offset(center.dx, center.dy), thumbRadius + 5, accentPathColor);

    canvas.drawCircle(
        Offset(center.dx, center.dy), thumbRadius, primaryPathColor);

    canvas.drawPath(innerPath, primaryPathColor);
  }
}
