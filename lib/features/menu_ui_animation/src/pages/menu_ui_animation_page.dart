import 'package:flutter/material.dart';
import 'package:lalo_dart_general_examples/features/menu_ui_animation/src/widgets/widgets.dart';

class MenuUiAnimationPage extends StatelessWidget {
  const MenuUiAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFa8ddea),
      ),
      body: ListView(
        children: const [
          CustomExpansionTile(
            title: "HEALTHCARE",
            backgroundColor: Color(0xFFa8ddea),
            textColor: Color(0xFF3b5a95),
            children: [
              'Skincare',
              'Personal Care',
              'Health',
              'Eye Care',
            ],
          ),
          CustomExpansionTile(
            title: "FOOD & DRINK",
            backgroundColor: Color(0xFF066f4b),
            textColor: Color(0xFFf9bb54),
            children: [
              'Fruits',
              'Frozen Food',
              'Bakery',
              'Snacks',
              'Noodles & Pasta',
              'Rice & Cooking oil',
            ],
          ),
          CustomExpansionTile(
            title: "BEAUTY",
            backgroundColor: Color(0xFFfecaca),
            textColor: Color(0xFFfc5963),
            children: [
              'Fruits',
              'Frozen Food',
              'Bakery',
              'Snacks',
              'Noodles & Pasta',
              'Rice & Cooking oil',
            ],
          ),
          CustomExpansionTile(
            title: "BABY & KIDS",
            backgroundColor: Color(0XFF183c8c),
            textColor: Color(0xFFfecaca),
            children: [
              'Fruits',
              'Frozen Food',
              'Bakery',
              'Snacks',
              'Noodles & Pasta',
              'Rice & Cooking oil',
            ],
          ),
          CustomExpansionTile(
            title: "HOMEWARE",
            backgroundColor: Color(0xFFf9bb54),
            children: [
              'Fruits',
              'Frozen Food',
              'Bakery',
              'Snacks',
              'Noodles & Pasta',
              'Rice & Cooking oil',
            ],
          ),
          CustomExpansionTile(
            title: "GARDENING",
            backgroundColor: Color(0xFFfc5963),
            children: [
              'Fruits',
              'Frozen Food',
              'Bakery',
              'Snacks',
              'Noodles & Pasta',
              'Rice & Cooking oil',
            ],
          ),
        ],
      ),
    );
  }
}
