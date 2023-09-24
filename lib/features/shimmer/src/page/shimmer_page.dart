import 'package:flutter/material.dart';

import '../../page.dart';

class ShimmerPage extends StatelessWidget {
  const ShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer"),
      ),
      body: FutureBuilder<bool>(
        future: Future.delayed(const Duration(seconds: 5), () => true),
        initialData: false,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data ?? false) {
            return const DataPage();
          }

          return const LoadingPage();
        },
      ),
    );
  }
}
