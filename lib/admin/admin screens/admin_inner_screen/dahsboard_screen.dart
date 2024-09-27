import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/admin/admin%20models/dashboard_btn_model.dart';
import 'package:online_food_ordering_app/admin/admin%20providers/admin_theme_provider.dart';
import 'package:online_food_ordering_app/admin/admin%20services/admin_assets_manager.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/admin_title_text.dart';
import 'package:online_food_ordering_app/admin/admin%20widgets/dashboard_btns.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AdminThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: "Dashboard Screen"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assetsmanager.cart2),
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.setDarkTheme(
                    themeValue: !themeProvider.getIsDarkTheme);
              },
              icon: Icon(themeProvider.getIsDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            DashboardButtonsModel.dashboardBtnList(context).length,
            (index) => DashboardButtonsWidget(
              text: DashboardButtonsModel.dashboardBtnList(context)[index].text,
              imagePath: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .imagePath,
              onPressed: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .onPressed,
            ),
          ),
        ));
  }
}
