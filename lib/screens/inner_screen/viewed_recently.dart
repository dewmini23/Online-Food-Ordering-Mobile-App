import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
// import 'package:online_food_ordering_app/screens/cart/bottom_checkout.dart';
// import 'package:online_food_ordering_app/screens/cart/cart_widget.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/empty_cart.dart';
import 'package:online_food_ordering_app/widgets/products/product_widget.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';

class ViewedRecentlyScreen extends StatelessWidget {
  static const routeName = "/ViewedRecentlyScreen";
  const ViewedRecentlyScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const Scaffold(
            body: EmptyBagwidget(
              imagePath: Assetsmanager.recent,
              title: "No Viewed Products Yet",
              subtitle:
                  "Looks Like Your History is Empty \nView Something of Your Taste!",
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: const TitlesTextWidget(label: "Viewed Recently (6)"),
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
            body: DynamicHeightGridView(
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                builder: (context, index) {
                  return const ProductWidget(
                    productId: "",
                  );
                },
                itemCount: 200,
                crossAxisCount: 2),
          );
  }
}
