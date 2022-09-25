import 'package:flutter/material.dart';
import 'package:food_delivery/core/routes/routes.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/screens/food_details/popular_food_details.dart';
import 'package:food_delivery/screens/food_details/recommedned_food_details.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';
import 'package:food_delivery/data/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      home: MainFoodPage(),
    );
  }
}
