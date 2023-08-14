import 'package:flutter/material.dart';

class MoonIndicator extends StatefulWidget {
  const MoonIndicator({
    super.key,
    this.color,
    this.size = 10,
  });
  final Color? color;
  final double size;

  @override
  State<MoonIndicator> createState() => _MoonIndicatorState();
}

class _MoonIndicatorState extends State<MoonIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool choice = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? Theme.of(context).colorScheme.primary;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
            child: Column(
              children: [
                Container(
                  height: widget.size,
                  width: widget.size,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: widget.size,
                  width: widget.size,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: widget.size,
                  width: widget.size,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: color),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
