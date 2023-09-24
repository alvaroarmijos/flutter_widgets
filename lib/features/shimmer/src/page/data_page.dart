import 'package:flutter/material.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          "Hello",
          style: textTheme.titleLarge,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: 400,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blueGrey),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem Ipsum",
                  style: textTheme.titleMedium,
                ),
                const Text(
                    "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet")
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Sed scelerisque est eu erat",
          style: textTheme.titleLarge,
        ),
        const ListTile(
          title: Text("Quisque ac justo in mauris "),
          trailing: Icon(Icons.navigate_next),
        ),
        const ListTile(
          title: Text("Quisque ac justo in mauris "),
          trailing: Icon(Icons.navigate_next),
        ),
        const ListTile(
          title: Text("Quisque ac justo in mauris "),
          trailing: Icon(Icons.navigate_next),
        ),
        const ListTile(
          title: Text("Quisque ac justo in mauris "),
          trailing: Icon(Icons.navigate_next),
        ),
      ],
    );
  }
}
