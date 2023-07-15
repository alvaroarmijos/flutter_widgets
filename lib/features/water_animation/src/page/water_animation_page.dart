import 'dart:async';

import 'package:flutter/material.dart';

import '../../components.dart';

class WaterAnimationPage extends StatefulWidget {
  const WaterAnimationPage({super.key});

  @override
  State<WaterAnimationPage> createState() => _WaterAnimationPageState();
}

class _WaterAnimationPageState extends State<WaterAnimationPage>
    with TickerProviderStateMixin {
  int percent = 0;

  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  late AnimationController heigthController;
  late Animation<double> heigthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: firstController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: secondController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: thirdController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(begin: 0.0, end: 1).animate(
        CurvedAnimation(parent: fourthController, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    Timer(const Duration(seconds: 2), () {
      firstController.forward();
    });

    Timer(const Duration(milliseconds: 1600), () {
      secondController.forward();
    });

    Timer(const Duration(milliseconds: 800), () {
      thirdController.forward();
    });

    fourthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Text('$percent %',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    wordSpacing: 3,
                    color: Colors.purple.withOpacity(.7)),
                textScaleFactor: 7),
          ),
          Wave(
            percent: percent,
            a: firstAnimation.value,
            b: secondAnimation.value,
            c: thirdAnimation.value,
            d: fourthAnimation.value,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onPressed, child: const Icon(Icons.add)),
    );
  }

  void onPressed() {
    if (percent >= 100) {
      percent = 0;
    } else {
      percent += 10;
    }
  }
}
