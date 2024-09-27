import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/admin%20orders/admin_orders_screen.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/admin_search_screen.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/edit_upload_product_form.dart';
import 'package:online_food_ordering_app/admin/admin%20services/admin_assets_manager.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(context) => [
        DashboardButtonsModel(
          text: "Add a new product",
          imagePath: Assetsmanager.cart1,
          onPressed: () {
            Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "inspect all products",
          imagePath: Assetsmanager.cart2,
          onPressed: () {
            Navigator.pushNamed(context, AdminSearchScreen.routeName);
          },
        ),
        DashboardButtonsModel(
          text: "View Orders",
          imagePath: Assetsmanager.wishBag,
          onPressed: () {
            Navigator.pushNamed(context, AdminOrdersScreenFree.routeName);
          },
        ),
      ];
}
