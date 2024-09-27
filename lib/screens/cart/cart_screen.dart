import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/providers/cart_provider.dart';
import 'package:online_food_ordering_app/screens/cart/cart_widget.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/services/my_app_functions.dart';
import 'package:online_food_ordering_app/widgets/empty_bag.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import 'bottom_checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartitems.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assetsmanager.cart1,
              title: "Your cart is empty",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomSheetWidget(),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assetsmanager.cart2,
                ),
              ),
              title: TitlesTextWidget(
                  label: "Cart (${cartProvider.getCartitems.length})"),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                        isError: false,
                        context: context,
                        subtitle:
                            "This will remove all products in your cart!!",
                        fct: () {
                          cartProvider.clearLocalCart();
                        });
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: cartProvider.getCartitems.length,
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: cartProvider.getCartitems.values
                                .toList()[index],
                            child: const CartWidget());
                      }),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 10,
                )
              ],
            ),
          );
  }
}
