import 'package:flutter/material.dart';

class ModalListTile extends StatelessWidget {
  const ModalListTile({
    super.key,
    this.backgroundColor,
    this.leading,
    this.title,
    this.onTap,
  });

  final Color? backgroundColor;
  final Widget? leading;
  final Widget? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = this.backgroundColor ??
        theme.colorScheme.surfaceVariant.withOpacity(0.3);

    return Material(
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: backgroundColor,
        leading: leading,
        title: title,
        onTap: onTap,
      ),
    );
  }
}
