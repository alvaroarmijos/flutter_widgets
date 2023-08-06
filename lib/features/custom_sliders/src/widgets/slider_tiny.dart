import 'package:flutter/material.dart';

import '../../widgets.dart';

class SliderTiny extends StatelessWidget {
  const SliderTiny({
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
        thumbShape: const TinySliderThumb(
          thumbHeight: 28,
        ),
        trackShape: CustomTrackShape(),
        thumbColor: Colors.grey,
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

class TinySliderThumb extends SliderComponentShape {
  final double thumbHeight;

  const TinySliderThumb({
    required this.thumbHeight,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbHeight);
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
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final innerPathColor2 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(center.dx, center.dy),
          width: thumbHeight / 3,
          height: thumbHeight),
      const Radius.circular(4),
    );

    innerPath.addRRect(fullRect);
    canvas.drawPath(innerPath, innerPathColor);
    canvas.drawPath(innerPath, innerPathColor2);
  }
}
