import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    required this.children,
  });

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final List<String> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context);

    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      backgroundColor: backgroundColor,
      collapsedBackgroundColor: backgroundColor,
      trailing: const SizedBox.shrink(),
      title: Text(
        title,
        style: textTheme.textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(
            bottom: 28,
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...children
                  .map(
                    (text) => Text(
                      text,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
