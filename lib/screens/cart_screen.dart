import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: TitlesTextWidget(label: "CartScreen"),),
    );
  }
}
