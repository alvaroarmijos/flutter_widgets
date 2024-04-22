import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/custom_modal/widgets.dart';

class CustomModalPage extends StatelessWidget {
  const CustomModalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Modal'),
      ),
      body: Builder(
        builder: (context) {
          return Center(
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                useSafeArea: true,
                isDismissible: false,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                ),
                context: context,
                builder: (context) => const CustomModal(),
              ),
              child: const Text('Show Modal'),
            ),
          );
        },
      ),
    );
  }
}
