import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20providers/admin_products_provider.dart';
import 'package:online_food_ordering_app/admin/admin%20providers/admin_theme_provider.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/admin%20orders/admin_orders_screen.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/admin_search_screen.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/dahsboard_screen.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/edit_upload_product_form.dart';
import 'package:provider/provider.dart';

// Import user app providers and screens
import 'package:online_food_ordering_app/bottom_navigation_bar.dart';
import 'package:online_food_ordering_app/consts/theme_data.dart';
import 'package:online_food_ordering_app/providers/cart_provider.dart';
import 'package:online_food_ordering_app/providers/products_provider.dart';
import 'package:online_food_ordering_app/providers/theme_provider.dart'; // User theme provider
import 'package:online_food_ordering_app/providers/viewed_recently_provider.dart';
import 'package:online_food_ordering_app/providers/wishlist_provider.dart';
import 'package:online_food_ordering_app/screens/authentication/login.dart';
import 'package:online_food_ordering_app/screens/authentication/register.dart';
import 'package:online_food_ordering_app/screens/inner_screen/order/orders_screen.dart';
import 'package:online_food_ordering_app/screens/inner_screen/product_details.dart';
import 'package:online_food_ordering_app/screens/inner_screen/viewed_recently.dart';
import 'package:online_food_ordering_app/screens/inner_screen/wishlist.dart';
import 'package:online_food_ordering_app/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // User providers
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // User theme
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ChangeNotifierProvider(create: (_) => ViewedProdProvider()),

        // Admin providers
        ChangeNotifierProvider(create: (_) => AdminThemeProvider()),
        ChangeNotifierProvider(
            create: (_) => AdminProductsProvider()), // Admin theme
      ],
      child: Consumer2<ThemeProvider, AdminThemeProvider>(
        builder: (context, userThemeProvider, adminThemeProvider, child) {
          // Role-based switching: load either admin or user UI
          bool isAdmin = true; // Change this flag to switch between user/admin

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // ignore: dead_code
            title: isAdmin ? 'Shop Smart ADMIN EN' : 'Simply Yummy Restaurant',

            // Use user theme in user mode and admin theme in admin mode
            theme: Styles.themeData(
              isDarkTheme: isAdmin
                  // ignore: dead_code
                  ? adminThemeProvider.getIsDarkTheme // Admin side theme
                  // ignore: dead_code
                  : userThemeProvider.getIsDarkTheme, // User side theme
              context: context,
            ),
            // ignore: dead_code
            home: isAdmin ? const DashboardScreen() : const RootScreen(),
            routes: {
              // User routes
              RootScreen.routeName: (context) => const RootScreen(),
              ProductDetailsScreen.routeName: (context) =>
                  const ProductDetailsScreen(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  const ViewedRecentlyScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              OrdersScreenFree.routeName: (context) => const OrdersScreenFree(),
              SearchScreen.routeName: (context) => const SearchScreen(),

              // Admin routes
              DashboardScreen.routeName: (context) => const DashboardScreen(),
              // ignore: equal_keys_in_map
              AdminOrdersScreenFree.routeName: (context) =>
                  const AdminOrdersScreenFree(),
              AdminSearchScreen.routeName: (context) =>
                  const AdminSearchScreen(),
              EditOrUploadProductScreen.routeName: (context) =>
                  const EditOrUploadProductScreen(),
            },
          );
        },
      ),
    );
  }
}
