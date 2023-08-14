import 'package:flutter/material.dart';

class ThreeDotsIndicator extends StatefulWidget {
  const ThreeDotsIndicator({
    Key? key,
    this.color = Colors.blue,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;

  @override
  State<ThreeDotsIndicator> createState() => _ThreeDotsIndicatorState();
}

class _ThreeDotsIndicatorState extends State<ThreeDotsIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _index;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )
      ..repeat()
      ..addListener(() {
        setState(() {});
      });

    _index = Tween<double>(begin: 0, end: 3).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.only(bottom: _index.value < 1 ? 30 : 0),
            width: 10,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _index.value < 1 ? widget.color : Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          AnimatedContainer(
            margin: EdgeInsets.only(
                bottom: _index.value > 1 && _index.value < 2 ? 30 : 0),
            width: 10,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _index.value > 1 && _index.value < 2
                  ? widget.color
                  : Colors.grey,
            ),
          ),
          const SizedBox(width: 4),
          AnimatedContainer(
            margin: EdgeInsets.only(bottom: _index.value > 2 ? 30 : 0),
            width: 10,
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _index.value > 2 ? widget.color : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
