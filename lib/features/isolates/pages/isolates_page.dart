import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatesPage extends StatelessWidget {
  const IsolatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Isolates Example'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _startIsolate(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }

  // Function executed in the isolate
  void heavyComputation(SendPort sendPort) {
    int result = 0;
    for (int i = 0; i <= 10000000; i++) {
      result += i;
    }

    sendPort.send(result);
  }

  Future<int> _startIsolate() async {
    // A ReceivePort is an object that handles messages that are sent from
    // other isolates. Those messages are sent via a SendPort.
    final receivePort = ReceivePort();

    await Isolate.spawn(heavyComputation, receivePort.sendPort);

    final result = await receivePort.first;

    return result as int;
  }
}
