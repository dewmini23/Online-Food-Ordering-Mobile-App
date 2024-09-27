// import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:online_food_ordering_app/consts/app_constants.dart';
import 'package:online_food_ordering_app/models/product_model.dart';
import 'package:online_food_ordering_app/providers/cart_provider.dart';
import 'package:online_food_ordering_app/providers/viewed_recently_provider.dart';

import 'package:online_food_ordering_app/screens/inner_screen/product_details.dart';
import 'package:online_food_ordering_app/widgets/products/heart_btn.dart';
import 'package:online_food_ordering_app/widgets/subtitle_text.dart';
import 'package:provider/provider.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productsModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          viewedProdProvider.addViewedProd(productId: productsModel.productId);
          await Navigator.pushNamed(context, ProductDetailsScreen.routeName,
              arguments: productsModel.productId);
        },
        child: SizedBox(
          width: size.width * 0.45,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FancyShimmerImage(
                    imageUrl: productsModel.productImage,
                    height: size.width * 0.24,
                    width: size.width * 0.32,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      productsModel.productTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          HeartButtonWidget(
                            productsId: productsModel.productId,
                          ),
                          IconButton(
                            onPressed: () {
                              if (cartProvider.isProdinCart(
                                  productId: productsModel.productId)) {
                                return;
                              }
                              cartProvider.addProductToCart(
                                  productId: productsModel.productId);
                            },
                            icon: Icon(
                              cartProvider.isProdinCart(
                                      productId: productsModel.productId)
                                  ? Icons.check
                                  : Icons.add_shopping_cart_outlined,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: SubtitleTextWidget(
                        label: "${productsModel.productPrice}\$",
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
