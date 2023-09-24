import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;
  const Skeleton({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
