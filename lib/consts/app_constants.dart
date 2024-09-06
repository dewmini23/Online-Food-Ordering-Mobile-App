import 'package:online_food_ordering_app/models/categories_model.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';

class AppConstants {
  static const String imageUrl =
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  static List<String> bannersImages = [
    Assetsmanager.banner1,
    Assetsmanager.banner2,
    Assetsmanager.banner3,
  ];

  static List<CategoriesModel> categoriesList = [
    CategoriesModel(
        id: Assetsmanager.pizza, name: "Pizza", image: Assetsmanager.pizza),
    CategoriesModel(
        id: Assetsmanager.pasta, name: "Pasta", image: Assetsmanager.pasta),
    CategoriesModel(
        id: Assetsmanager.tacos, name: "Tacos", image: Assetsmanager.tacos),
    CategoriesModel(
        id: Assetsmanager.burger, name: "Burgers", image: Assetsmanager.burger),
    CategoriesModel(
        id: Assetsmanager.hotDrinks,
        name: "Hot Drinks",
        image: Assetsmanager.hotDrinks),
    CategoriesModel(
        id: Assetsmanager.beverage,
        name: "Beverages",
        image: Assetsmanager.beverage),
    CategoriesModel(
        id: Assetsmanager.dessert,
        name: "Desserts",
        image: Assetsmanager.dessert),
    CategoriesModel(
        id: Assetsmanager.snack, name: "Snacks", image: Assetsmanager.snack),
    CategoriesModel(
        id: Assetsmanager.hotdog, name: "HotDogs", image: Assetsmanager.hotdog),
    CategoriesModel(
        id: Assetsmanager.seafood,
        name: "SeaFood",
        image: Assetsmanager.seafood),
    CategoriesModel(
        id: Assetsmanager.bbq, name: "BBQ", image: Assetsmanager.bbq),
    CategoriesModel(
        id: Assetsmanager.rice,
        name: "Rice-Choices",
        image: Assetsmanager.rice),
  ];
}
