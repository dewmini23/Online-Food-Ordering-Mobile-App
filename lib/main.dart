import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/bottom_navigation_bar.dart';
// import 'package:online_food_ordering_app/bottom_navigation_bar.dart';
import 'package:online_food_ordering_app/consts/theme_data.dart';
import 'package:online_food_ordering_app/providers/products_provider.dart';
import 'package:online_food_ordering_app/providers/theme_provider.dart';
import 'package:online_food_ordering_app/screens/authentication/forgot_password.dart';
import 'package:online_food_ordering_app/screens/authentication/login.dart';
import 'package:online_food_ordering_app/screens/authentication/register.dart';
import 'package:online_food_ordering_app/screens/inner_screen/order/orders_screen.dart';
import 'package:online_food_ordering_app/screens/inner_screen/product_details.dart';
import 'package:online_food_ordering_app/screens/inner_screen/viewed_recently.dart';
import 'package:online_food_ordering_app/screens/inner_screen/wishlist.dart';
import 'package:online_food_ordering_app/screens/search_screen.dart';
// import 'package:online_food_ordering_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          // in here we have to add all providers
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          // in here we have to add all providers
          return ProductsProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Simply Yummy Restaurant',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          // home: const RootScreen(),
          home: const RootScreen(),
          routes: {
            RootScreen.routeName: (context) => const RootScreen(),
            ProductDetailsScreen.routeName: (context) =>
                const ProductDetailsScreen(),
            WishlistScreen.routeName: (context) => const WishlistScreen(),
            // ignore: equal_keys_in_map
            ViewedRecentlyScreen.routeName: (context) =>
                const ViewedRecentlyScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            SearchScreen.routeName: (context) => const SearchScreen(),
          },
        );
      }),
    ); // Close elevatedButtonTheme
    // Close ThemeData
  }
}
