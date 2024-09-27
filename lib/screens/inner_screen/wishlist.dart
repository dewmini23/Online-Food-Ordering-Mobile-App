import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/providers/wishlist_provider.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/empty_bag.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

import '../../services/my_app_functions.dart';
import '../../widgets/products/product_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.getWishlists.isEmpty
        ? const Scaffold(
            body: EmptyBagWidget(
              imagePath: Assetsmanager.wishBag,
              title: "Nothing in ur wishlist yet",
              subtitle:
                  "Looks like your cart is empty add something and make me happy",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  Assetsmanager.cart2,
                ),
              ),
              title: TitlesTextWidget(
                  label: "Wishlist (${wishlistProvider.getWishlists.length})"),
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunctions.showErrorOrWarningDialog(
                      isError: false,
                      context: context,
                      subtitle: "Clear cart?",
                      fct: () {
                        wishlistProvider.clearLocalWishlist();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            body: DynamicHeightGridView(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              builder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductWidget(
                    productId: wishlistProvider.getWishlists.values
                        .toList()[index]
                        .productId,
                  ),
                );
              },
              itemCount: wishlistProvider.getWishlists.length,
              crossAxisCount: 2,
            ),
          );
  }
}
