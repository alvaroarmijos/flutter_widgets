import 'package:flutter/material.dart';

class Wave extends StatelessWidget {
  final int percent;
  final double a;
  final double b;
  final double c;
  final double d;

  const Wave(
      {super.key,
      required this.a,
      required this.b,
      required this.c,
      required this.d,
      required this.percent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (percent / 100),
      width: double.infinity,
      child: CustomPaint(
        painter: _WavePainter(
          color: Colors.deepPurple,
          a: a,
          b: b,
          c: c,
          d: d,
        ),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  final double a;
  final double b;
  final double c;
  final double d;

  _WavePainter({
    this.color = Colors.blueAccent,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color.withOpacity(.8)
      ..style = PaintingStyle.fill;

    const waveHeight = 60.0;

    var path = Path()
      ..moveTo(0, waveHeight * a)
      ..cubicTo(size.width * .4, waveHeight * b, size.width * .7,
          waveHeight * c, size.width, waveHeight * d)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
