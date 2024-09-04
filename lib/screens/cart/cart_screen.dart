import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/screens/cart/bottom_checkout.dart';
import 'package:online_food_ordering_app/screens/cart/cart_widget.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/empty_cart.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Scaffold(
            body: EmptyBagwidget(
              imagePath: Assetsmanager.cart1,
              title: "Your Cart is Empty",
              subtitle:
                  "Looks Like Your Cart is Empty \nAdd Something to Your Taste!",
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomSheetWidget(),
            appBar: AppBar(
              title: const TitlesTextWidget(label: "Cart (6)"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
              leading: Image.asset(Assetsmanager.logo),
            ),
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CartWidget();
                }),
          );
  }
}
