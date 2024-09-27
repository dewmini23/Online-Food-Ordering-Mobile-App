import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
// import 'package:online_food_ordering_app/providers/products_provider.dart';
import 'package:online_food_ordering_app/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({
    super.key,
    this.bkgColor = Colors.transparent,
    this.size = 20,
    required this.productsId,
    // this.isInWishlist = false,
  });
  final Color bkgColor;
  final double size;
  final String productsId;
  // final bool? isInWishlist;
  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: widget.bkgColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: () {
          wishlistProvider.addOrRemoveFromWishlist(
            productId: widget.productsId,
          );
        },
        icon: Icon(
          wishlistProvider.isProdinWishlist(
            productId: widget.productsId,
          )
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color: wishlistProvider.isProdinWishlist(
            productId: widget.productsId,
          )
              ? Colors.red
              : Colors.grey,
        ),
      ),
    );
  }
}
