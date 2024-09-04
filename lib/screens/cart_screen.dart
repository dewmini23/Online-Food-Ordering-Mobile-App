import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyBagwidget(
        imagePath: Assetsmanager.cart1,
        title: "Your Cart is Empty",
        subtitle:
            "Looks Like Your Cart is Empty \nAdd Something to Your Taste!",
        buttonText: "Shop Now",
      ),
    );
  }
}
