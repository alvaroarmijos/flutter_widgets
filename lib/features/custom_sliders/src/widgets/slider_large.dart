import 'package:flutter/material.dart';

import '../../widgets.dart';

class SliderLarge extends StatelessWidget {
  const SliderLarge({
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
        thumbShape: const LargeSliderThumb(
          thumbLarge: 40,
        ),
        trackShape: CustomTrackShape(),
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

class LargeSliderThumb extends SliderComponentShape {
  final double thumbLarge;

  const LargeSliderThumb({
    required this.thumbLarge,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbLarge);
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

    final innerPathColor = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final innerPathColor2 = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(center.dx, center.dy),
          width: thumbLarge,
          height: thumbLarge / 3),
      const Radius.circular(8),
    );

    innerPath.addRRect(fullRect);
    canvas.drawPath(innerPath, innerPathColor);
    canvas.drawPath(innerPath, innerPathColor2);
  }
}
