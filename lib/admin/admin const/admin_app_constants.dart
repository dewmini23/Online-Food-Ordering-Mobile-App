import 'package:flutter/material.dart';

class AdminAppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Pizza',
    'Pasta',
    'Tacos',
    'Burgers',
    'Hot Drinks',
    'Beverages',
    'Desserts',
    'Snacks',
    'HotDogs',
    'Seafood',
    'Drinks',
    'BBQ',
    'Rice-choices',
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }
}
