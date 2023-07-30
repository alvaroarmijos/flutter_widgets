import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/ripple_animation/widgets.dart';

class RippleAnimationPage extends StatelessWidget {
  const RippleAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: RippleAnimation(
            child: Icon(
          Icons.emergency_share,
          color: Colors.white,
          size: 40,
        )),
      ),
    );
  }
}
