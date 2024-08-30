import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: TitlesTextWidget(label: "ProfileScreen"),),
    );
  }
}
