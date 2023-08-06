import 'package:flutter/material.dart';

import '../../widgets.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator({
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
        thumbShape: const IndicatorSliderThumb(
          thumbHeight: 28,
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

class IndicatorSliderThumb extends SliderComponentShape {
  final double thumbHeight;

  const IndicatorSliderThumb({
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
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    innerPath.addPolygon([
      Offset(center.dx - thumbHeight / 3, center.dy - thumbHeight),
      Offset(center.dx - thumbHeight / 3, center.dy - thumbHeight / 2),
      Offset(center.dx, center.dy - 4),
      Offset(center.dx + thumbHeight / 3, center.dy - thumbHeight / 2),
      Offset(center.dx + thumbHeight / 3, center.dy - thumbHeight),
    ], true);
    canvas.drawPath(innerPath, innerPathColor);
  }
}
