import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      // period: Duration(seconds: 10),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitlesTextWidget(
        label: "Simply Yummy",
        fontSize: fontSize,
      ),
    );
  }
}
