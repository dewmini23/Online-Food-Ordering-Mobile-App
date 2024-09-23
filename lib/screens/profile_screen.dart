import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:online_food_ordering_app/providers/theme_provider.dart';
import 'package:online_food_ordering_app/screens/inner_screen/viewed_recently.dart';
import 'package:online_food_ordering_app/screens/inner_screen/wishlist.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/services/my_app_functions.dart';
import 'package:online_food_ordering_app/widgets/app_name_text.dart';
import 'package:online_food_ordering_app/widgets/subtitle_text.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(
          fontSize: 20,
        ),
        leading: Image.asset(Assetsmanager.logo),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Visibility(
              visible: false,
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: TitlesTextWidget(
                  label: "Please login in to shop with us",
                ),
              ),
            ),
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical:
                        15), // Adding x and y spaces to profile pic and name + email
                child: Row(
                  // Here have the profile pic and username, email
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Colors.lightBlue,
                          width: 3,
                        ),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://w7.pngwing.com/pngs/177/551/png-transparent-user-interface-design-computer-icons-default-stephen-salazar-graphy-user-interface-design-computer-wallpaper-sphere-thumbnail.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      // Leaving space between profile pic and name + email
                      width: 30,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Kaveesha Dewmini"),
                        SizedBox(
                          height: 6,
                        ), // Adding space between name and email
                        SubtitleTextWidget(label: "kavee123@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const TitlesTextWidget(
                    label: "General",
                  ),
                  const SizedBox(
                    height:
                        10, // keeping the space between general and the list
                  ),
                  CustomListTitle(
                    // class we created below for ListTitles
                    text: "All Orders",
                    imagePath: Assetsmanager.orders,
                    function: () {},
                  ),
                  CustomListTitle(
                    // class we created below for ListTitles
                    text: "wishlist",
                    imagePath: Assetsmanager.wishlist,
                    function: () {
                      Navigator.pushNamed(context, WishlistScreen.routName);
                    },
                  ),
                  CustomListTitle(
                    // class we created below for ListTitles
                    text: "Viewed recently",
                    imagePath: Assetsmanager.viewed,
                    function: () {
                      Navigator.pushNamed(
                          context, ViewedRecentlyScreen.routName);
                    },
                  ),
                  CustomListTitle(
                    // class we created below for ListTitles
                    text: "Address",
                    imagePath: Assetsmanager.address,
                    function: () {},
                  ),
                  const SizedBox(
                    height:
                        10, // keeping the space between general and the list
                  ),
                  const Divider(),
                  const TitlesTextWidget(
                    label: "Settings",
                  ),
                  const SizedBox(
                    height:
                        10, // keeping the space between general and the list
                  ),
                  SwitchListTile(
                      secondary: Image.asset(
                        Assetsmanager.theme,
                        height: 40,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Dark Mode"
                          : "Light Mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(value);
                      }),
                ],
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                icon: const Icon(Icons.login),
                label: const Text("Login"),
                onPressed: () async {
                  await MyAppFunctions.showErrorOrWarningDialog(
                      // calling MyAPPFunctions to handle warnings/errors instead of using a long code
                      context: context,
                      subtitle: "Sure You Want to Signout?",
                      fct: () {},
                      isError: false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });
  final String imagePath, text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      title: SubtitleTextWidget(label: text),
      leading: Image.asset(
        imagePath,
        height: 40,
      ),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
