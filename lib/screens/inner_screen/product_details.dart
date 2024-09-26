import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:online_food_ordering_app/consts/app_constants.dart';
import 'package:online_food_ordering_app/providers/products_provider.dart';
// import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/app_name_text.dart';
import 'package:online_food_ordering_app/widgets/products/heart_btn.dart';
import 'package:online_food_ordering_app/widgets/subtitle_text.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = "/ProductDetailsScreen";
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    String? productId = ModalRoute.of(context)!.settings.arguments as String?;
    final getCurrProduct = productsProvider.findByProdId(productId!);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            )),
        title: const AppNameTextWidget(
          fontSize: 20,
        ),
      ),
      body: getCurrProduct == null
          ? const SizedBox.shrink()
          : SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: getCurrProduct.productImage,
                    height: size.height * 0.40,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                getCurrProduct.productTitle,
                                softWrap: true,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SubtitleTextWidget(
                              label: "${getCurrProduct.productPrice}\$ ",
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              HeartButtonWidget(
                                bgkColor: Colors.blue.shade400,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: kBottomNavigationBarHeight - 10,
                                  child: ElevatedButton.icon(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        )),
                                    onPressed: () {},
                                    icon: const Icon(Icons.add_shopping_cart),
                                    label: const Text("Add to Cart"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TitlesTextWidget(label: "About This Item"),
                            SubtitleTextWidget(
                                label: "In ${getCurrProduct.productCategory}"),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SubtitleTextWidget(
                            label: getCurrProduct.productDescription),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
