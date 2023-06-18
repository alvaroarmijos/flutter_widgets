import 'package:flutter/material.dart';

class SliverAppBarPage extends StatelessWidget {
  const SliverAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundImage =
        'https://img.freepik.com/premium-vector/sea-landscape-tropical-beach-ocean-seashore_165488-908.jpg';

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          floating: true,
          backgroundColor: const Color(0xFF93e4f8),
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            background: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 150.0,
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
              Container(color: Colors.red),
              Container(color: Colors.purple),
              Container(color: Colors.green),
              Container(color: Colors.orange),
              Container(color: Colors.yellow),
              Container(color: Colors.pink),
            ],
          ),
        ),
      ],
    ));
  }
}
