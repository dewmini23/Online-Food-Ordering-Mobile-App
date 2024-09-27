import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20screens/admin_inner_screen/admin%20orders/admin_orders_widget.dart';
import 'package:online_food_ordering_app/admin/admin%20services/admin_assets_manager.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_empty_bag.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_title_text.dart';

class AdminOrdersScreenFree extends StatefulWidget {
  static const routeName = '/OrderScreen';

  const AdminOrdersScreenFree({Key? key}) : super(key: key);

  @override
  State<AdminOrdersScreenFree> createState() => _AdminOrdersScreenFreeState();
}

class _AdminOrdersScreenFreeState extends State<AdminOrdersScreenFree> {
  bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(
            label: 'Placed orders',
          ),
        ),
        body: isEmptyOrders
            ? const EmptyBagWidget(
                imagePath: Assetsmanager.cart1,
                title: "No orders has been placed yet",
                subtitle: "",
              )
            : ListView.separated(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                    child: OrdersWidgetFree(),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                      // thickness: 8,
                      // color: Colors.red,
                      );
                },
              ));
  }
}
