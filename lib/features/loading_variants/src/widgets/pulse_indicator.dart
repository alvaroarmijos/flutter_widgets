import 'package:flutter/material.dart';

class PulseIndicator extends StatefulWidget {
  const PulseIndicator({
    Key? key,
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;

  @override
  State<PulseIndicator> createState() => _PulseIndicatorState();
}

class _PulseIndicatorState extends State<PulseIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _widthAnimation;

  double _width = 5;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _widthAnimation = Tween<double>(begin: 5, end: 40).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.decelerate,
      ),
    );

    _animationController.addListener(() {
      setState(() {
        _width = _widthAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
              visible: _animationController.value < 0.3,
              child: AnimatedContainer(
                width: _width + 30,
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.backgroundColor,
                      width: 4,
                    )),
              )),
          AnimatedContainer(
            width: _width,
            duration: const Duration(milliseconds: 600),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
