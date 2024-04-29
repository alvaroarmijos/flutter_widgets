import 'package:flutter/material.dart';

const labelButton = 'Get Premium';
const backgroundColor = Color(0xFF3b84f4);

class ButtonStylesPage extends StatelessWidget {
  const ButtonStylesPage({super.key});

  final space = const SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Styles'),
      ),
      body: Theme(
        data: ThemeData(
            elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(),
          ),
        )),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Text(labelButton),
            ),
            space,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Text(labelButton),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            space,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Text(labelButton),
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
              ),
            ),
            space,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch_outlined),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(labelButton),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.white,
                    width: 3,
                    style: BorderStyle.solid,
                    strokeAlign: -1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            space,
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch),
              label: const Text(labelButton),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            space,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.rocket_launch_outlined),
                label: const Text(labelButton),
                style: ElevatedButton.styleFrom(
                  shadowColor: backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            space,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withOpacity(0.4),
                    Colors.deepPurpleAccent,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.rocket_launch_outlined),
                  label: const Text(labelButton),
                  style: ElevatedButton.styleFrom(
                    shadowColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            space,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                color: backgroundColor.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.rocket_launch_outlined),
                  label: const Text(labelButton),
                  style: ElevatedButton.styleFrom(
                    shadowColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            space,
            Container(
              height: 44,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    backgroundColor,
                    Colors.deepPurpleAccent,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.rocket_launch),
                label: const Text(labelButton),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
