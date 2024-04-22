import 'package:flutter/material.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({
    super.key,
    required this.title,
    this.onTap,
    this.newItem = false,
  });

  final String title;
  final VoidCallback? onTap;
  final bool newItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.navigate_next),
        onTap: onTap,
        leading: newItem ? const Icon(Icons.new_releases_rounded) : null,
      ),
    );
  }
}
