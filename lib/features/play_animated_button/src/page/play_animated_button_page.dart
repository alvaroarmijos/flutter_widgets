import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/play_animated_button/widgets.dart';

class PlayAnimatedButtonPage extends StatelessWidget {
  const PlayAnimatedButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: PlayAnimatedButton(
          onPlay: () => print('play'),
        ),
      ),
    );
  }
}
