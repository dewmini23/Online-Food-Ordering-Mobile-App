import 'package:flutter/material.dart';
// import 'package:online_food_ordering_app/consts/app_colors.dart';
import 'package:online_food_ordering_app/providers/theme_provider.dart';
import 'package:online_food_ordering_app/widgets/subtitle_text.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); // defined a provider
    return Scaffold(
      // backgroundColor: AppColors.lightScaffoldColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TODO add text
         const SubtitleTextWidget(label: "Hello World"),
         TitlesTextWidget(
          label: "Hello This is A Title" *10,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Hello world")),
          SwitchListTile(
              title: Text(
                  themeProvider.getIsDarkTheme ? "Dark Mode" : "Light Mode"),
              value: themeProvider.getIsDarkTheme,
              onChanged: (value) {
                themeProvider.setDarkTheme(value);
              }),
        ],
      )),
    );
  }
}
