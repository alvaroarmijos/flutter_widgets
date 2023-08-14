import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/loading_variants/widgets.dart';

class LoadingVariantsPage extends StatelessWidget {
  const LoadingVariantsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Variants"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
            ),
          ),
          CupertinoActivityIndicator(
            radius: 20,
            color: colorScheme.primary,
          ),
          const Center(
            child: RefreshProgressIndicator(),
          ),
          const Center(
            child: LinearProgressIndicator(
              backgroundColor: Colors.transparent,
            ),
          ),
          const MoonIndicator(),
          const Center(
            child: DoubleCircularProgressIndicator(),
          ),
          PulseIndicator(
            color: colorScheme.primary,
          ),
          ThreeDotsIndicator(
            color: colorScheme.primary,
          )
        ],
      ),
    );
  }
}
