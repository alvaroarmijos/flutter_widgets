import 'package:flutter/material.dart';

import '../../widgets.dart';

class CustomSlidersPage extends StatefulWidget {
  const CustomSlidersPage({super.key});

  @override
  State<CustomSlidersPage> createState() => _CustomSlidersPageState();
}

class _CustomSlidersPageState extends State<CustomSlidersPage> {
  double _squareSlider = 0.0;
  double _ringSlider = 0.0;
  double _tinySlider = 0.0;
  double _largeSlider = 0.0;
  double _indicatorSlider = 0.0;
  RangeValues _squareValues = const RangeValues(0.0, 100.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SliderSquare(
              value: _squareSlider,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _squareSlider = value;
                });
              },
            ),
            RangeSliderSquare(
              values: _squareValues,
              max: 100,
              onChanged: (values) {
                setState(() {
                  _squareValues = values;
                });
              },
            ),
            SliderRing(
              value: _ringSlider,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _ringSlider = value;
                });
              },
            ),
            SliderTiny(
              value: _tinySlider,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _tinySlider = value;
                });
              },
            ),
            SliderLarge(
              value: _largeSlider,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _largeSlider = value;
                });
              },
            ),
            SliderIndicator(
              value: _indicatorSlider,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _indicatorSlider = value;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
