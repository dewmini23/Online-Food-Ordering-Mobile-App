import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20providers/admin_products_provider.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/edit_upload_product_form.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_subtitle_text.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_title_text.dart';
import 'package:provider/provider.dart';

class AdminProductWidget extends StatefulWidget {
  const AdminProductWidget({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<AdminProductWidget> createState() => _AdminProductWidgetState();
}

class _AdminProductWidgetState extends State<AdminProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<AdminProductsProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditOrUploadProductScreen(
                        productModel: getCurrProduct,
                      );
                    },
                  ),
                );
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl: getCurrProduct.productImage,
                      height: size.height * 0.22,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: TitlesTextWidget(
                      label: getCurrProduct.productTitle,
                      fontSize: 18,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SubtitleTextWidget(
                      label: "${getCurrProduct.productPrice}\$",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
          );
  }
}
