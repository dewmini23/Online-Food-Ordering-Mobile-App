import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:online_food_ordering_app/consts/app_colors.dart';
import 'package:online_food_ordering_app/providers/cart_provider.dart';
import 'package:online_food_ordering_app/screens/cart/cart_screen.dart';
import 'package:online_food_ordering_app/screens/home_screen.dart';
import 'package:online_food_ordering_app/screens/profile_screen.dart';
import 'package:online_food_ordering_app/screens/search_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  static const routeName = "/RootScreen";
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
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: PageView(
        physics:
            const NeverScrollableScrollPhysics(), // to prevent scrolling between screeens
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:
            currentScreen, // to show which icon is selected and where / which page we are
        backgroundColor: AppColors
            .darkScaffoldColor, // changes the background color of navigation bar
        elevation: 10,
        height: kBottomNavigationBarHeight, // change the height of bar
        onDestinationSelected: (index) {
          setState(() {
            currentScreen = index;
          });
          controller!.jumpToPage(currentScreen);
        },
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.home),
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.search),
            icon: Icon(IconlyLight.search),
            label: "Search",
          ),
          NavigationDestination(
            selectedIcon: const Icon(IconlyBold.bag2),
            icon: Badge(
                label: Text(cartProvider.getCartitems.length.toString()),
                child: const Icon(IconlyLight.bag2)),
            label: "Cart",
          ),
          const NavigationDestination(
            selectedIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
            label: "Profile",
          )
        ],
      ),
    );
  }
}
