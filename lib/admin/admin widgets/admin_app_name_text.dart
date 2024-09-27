import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_title_text.dart';
import 'package:shimmer/shimmer.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 22),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitlesTextWidget(
        label: "Shop smart",
        fontSize: fontSize,
      ),
    );
  }
}
