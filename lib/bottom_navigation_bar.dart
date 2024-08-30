import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:online_food_ordering_app/screens/cart_screen.dart';
import 'package:online_food_ordering_app/screens/home_screen.dart';
import 'package:online_food_ordering_app/screens/profile_screen.dart';
import 'package:online_food_ordering_app/screens/search_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget>
      screens; // late is used here to say this variable will be initialized later in code
  int currentScreen = 0;
  late PageController? controller;

  @override
  void initState() {
    super.initState();
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen()
    ];
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), // to prevent scrolling between screeens 
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen, // to show which icon is selected and where / which page we are
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, // changes the background color of navigation bar
        elevation: 10,
        height: kBottomNavigationBarHeight, // change the height of bar
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller!.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: const Icon(IconlyLight.home) , label: "Home",
            ),
            NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: const Icon(IconlyLight.search) , label: "Search",
            ),
            NavigationDestination(
            selectedIcon: Icon(IconlyBold.bag2),
            icon: const Icon(IconlyLight.bag2) , label: "Cart",
            ),
            NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: const Icon(IconlyLight.profile) , label: "Profile",
            )
        ],
      ),
    );
  }
}
