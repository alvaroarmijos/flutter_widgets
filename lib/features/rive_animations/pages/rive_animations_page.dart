import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimationsPage extends StatefulWidget {
  const RiveAnimationsPage({super.key});

  @override
  State<RiveAnimationsPage> createState() => _RiveAnimationsPageState();
}

class _RiveAnimationsPageState extends State<RiveAnimationsPage> {
  SMINumber? _bump;
  double _progressValue = 0;

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    _bump = controller.getNumberInput('Number 1');
  }

  void _hitBump() {
    _bump?.value = _progressValue;
    _progressValue += 20;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rive Animations'),
      ),
      body: GestureDetector(
        onTap: _hitBump,
        child: RiveAnimation.asset(
          'assets/animations/miner_loading_bar.riv',
          fit: BoxFit.fitWidth,
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
