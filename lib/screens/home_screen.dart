import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:online_food_ordering_app/consts/app_constants.dart';
import 'package:online_food_ordering_app/providers/products_provider.dart';
// import 'package:online_food_ordering_app/consts/app_colors.dart';
import 'package:online_food_ordering_app/services/assets_manager.dart';
import 'package:online_food_ordering_app/widgets/app_name_text.dart';
import 'package:online_food_ordering_app/widgets/products/category_widget.dart';
import 'package:online_food_ordering_app/widgets/products/new_arrivals.dart';
import 'package:online_food_ordering_app/widgets/titles_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            Assetsmanager.cart2,
          ),
        ),
        title: const AppNameTextWidget(
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: size.height * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannersImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: AppConstants.bannersImages.length,
                    pagination: const SwiperPagination(
                      // alignment: Alignment.center, // to move two dots to somewhere you need
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Colors.red, color: Colors.white),
                    ),
                    autoplay: true,
                    autoplayDelay: 3000,
                    autoplayDisableOnInteraction: false,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const TitlesTextWidget(label: "Latest Arrivals"),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: productsProvider.getProducts[index],
                        child: const LatestArrivalProductWidget());
                  },
                ),
              ),
              const TitlesTextWidget(label: "Categories"),
              const SizedBox(
                height: 15.0,
              ),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                    List.generate(AppConstants.categoriesList.length, (index) {
                  return CategoryRoundedWidget(
                      image: AppConstants.categoriesList[index].image,
                      name: AppConstants.categoriesList[index].name);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
