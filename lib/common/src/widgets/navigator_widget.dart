import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
      ),
    );
  }
}
