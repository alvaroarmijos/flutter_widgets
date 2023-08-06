import 'package:flutter/material.dart';

import '../../widgets.dart';

class SliderSquare extends StatelessWidget {
  const SliderSquare({
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
        thumbShape: const SquareSliderThumb(
          thumbRadius: 24,
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

class RangeSliderSquare extends StatelessWidget {
  const RangeSliderSquare({
    super.key,
    required this.values,
    this.min = 0.0,
    this.max = 1.0,
    this.onChanged,
  });

  final RangeValues values;
  final double min;
  final double max;
  final void Function(RangeValues)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.0),
        trackHeight: 1,
        rangeThumbShape: const SquareRangeSliderThumb(
          thumbRadius: 25,
        ),
      ),
      child: RangeSlider(
        values: values,
        onChanged: onChanged,
        min: min,
        max: max,
      ),
    );
  }
}

class SquareSliderThumb extends SliderComponentShape {
  final double thumbRadius;

  const SquareSliderThumb({
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

    final innerPathColor = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(center.dx, center.dy),
          width: thumbRadius,
          height: thumbRadius),
      const Radius.circular(4),
    );

    innerPath.addRRect(fullRect);
    canvas.drawPath(innerPath, innerPathColor);
  }
}

class SquareRangeSliderThumb extends RangeSliderThumbShape {
  final double thumbRadius;

  const SquareRangeSliderThumb({
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
      bool? isDiscrete,
      bool? isEnabled,
      bool? isOnTop,
      TextDirection? textDirection,
      required SliderThemeData sliderTheme,
      Thumb? thumb,
      bool? isPressed}) {
    final Canvas canvas = context.canvas;

    final innerPathColor = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.black
      ..style = PaintingStyle.fill;

    var innerPath = Path();

    RRect fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: Offset(center.dx, center.dy),
          width: thumbRadius,
          height: thumbRadius),
      const Radius.circular(4),
    );

    innerPath.addRRect(fullRect);
    canvas.drawPath(innerPath, innerPathColor);
  }
}
