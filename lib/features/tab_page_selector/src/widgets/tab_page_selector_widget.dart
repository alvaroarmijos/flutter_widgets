import 'package:flutter/material.dart';

class TabPageSelectorWidget extends StatelessWidget {
  const TabPageSelectorWidget({
    super.key,
    required this.data,
  });

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Image.asset(
          data["image"]!,
          fit: BoxFit.fill,
          // height: 600,
        ),
        Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () {},
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            child: Text(
              data["description"]!,
              style:
                  textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
