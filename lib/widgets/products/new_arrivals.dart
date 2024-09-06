import 'dart:developer';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:online_food_ordering_app/consts/app_constants.dart';
import 'package:online_food_ordering_app/widgets/subtitle_text.dart';

class LatestArrivalProductWidget extends StatelessWidget {
  const LatestArrivalProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          log("to do add the navigate to the product details screen");
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
                    imageUrl: AppConstants.imageUrl,
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
                    const Text(
                      "Hawaiian Chicken Pizza",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              IconlyLight.heart,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_shopping_cart,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const FittedBox(
                      child: const SubtitleTextWidget(
                        label: "1100/= ",
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
