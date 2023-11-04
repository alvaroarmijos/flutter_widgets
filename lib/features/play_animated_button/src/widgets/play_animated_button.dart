import 'dart:async';

import 'package:flutter/material.dart';

enum ButtonStatus {
  play,
  pause,
  stop,
}

class PlayAnimatedButton extends StatefulWidget {
  const PlayAnimatedButton({
    super.key,
    this.onPlay,
    this.onPause,
    this.onStop,
  });

  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onStop;

  @override
  State<PlayAnimatedButton> createState() => _PlayAnimatedButtonState();
}

class _PlayAnimatedButtonState extends State<PlayAnimatedButton>
    with SingleTickerProviderStateMixin {
  late ButtonStatus status;
  late Animation<double> animation;
  late AnimationController controller;
  late Stopwatch stopwatch;
  String hoursStr = '00';
  String minutesStr = '00';
  String secondsStr = '00';

  @override
  void initState() {
    status = ButtonStatus.stop;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1200),
    )..forward();
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    stopwatch = Stopwatch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        updateStatus();
      },
      onDoubleTap: () {
        setState(() {
          status = ButtonStatus.stop;
          controller.forward();
          widget.onStop?.call();
          stopwatch.stop();
          stopwatch.reset();
        });
      },
      child: AnimatedContainer(
        curve: Curves.elasticInOut,
        constraints:
            BoxConstraints(maxWidth: status == ButtonStatus.stop ? 200 : 400),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        padding: const EdgeInsets.all(16),
        duration: const Duration(milliseconds: 500),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedIcon(
              icon: AnimatedIcons.pause_play,
              color: Colors.white,
              progress: animation,
            ),
            TimerText(stopwatch: stopwatch)
          ],
        ),
      ),
    );
  }

  void updateStatus() {
    switch (status) {
      case ButtonStatus.stop:
        setState(() {
          status = ButtonStatus.play;
          controller.reset();
          widget.onPlay?.call();
          stopwatch.start();
        });
        break;
      case ButtonStatus.play:
        setState(() {
          status = ButtonStatus.pause;
          controller.forward();
          widget.onPause?.call();
          stopwatch.stop();
        });
        break;
      case ButtonStatus.pause:
        setState(() {
          status = ButtonStatus.play;
          controller.reset();
          widget.onPlay?.call();
          stopwatch.start();
        });
        break;
      default:
        setState(() {
          status = ButtonStatus.stop;
          widget.onStop?.call();
          stopwatch.reset();
        });
    }
  }
}

class TimerText extends StatefulWidget {
  const TimerText({super.key, required this.stopwatch});
  final Stopwatch stopwatch;

  @override
  TimerTextState createState() => TimerTextState(stopwatch: stopwatch);
}

class TimerTextState extends State<TimerText> {
  late Timer timer;
  final Stopwatch stopwatch;

  TimerTextState({required this.stopwatch}) {
    timer = Timer.periodic(const Duration(milliseconds: 30), callback);
  }

  void callback(Timer timer) {
    if (stopwatch.isRunning) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        TimerTextFormatter.format(stopwatch.elapsedMilliseconds);
    return Text(formattedTime,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white));
  }
}

class TimerTextFormatter {
  static String format(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}
