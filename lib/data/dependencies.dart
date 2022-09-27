import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/products_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/data/api/popular_product_repo.dart';
import 'package:food_delivery/data/api/recommended_product_repo.dart';
import 'package:food_delivery/data/cart/cart_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL), fenix: true);
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()), fenix: true);
  //controllers
  Get.lazyPut(() => CartController(cartRepo: Get.find()), fenix: true);

  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()),
      fenix: true);
  Get.lazyPut(
      () => ProductsController(
          popularProductRepo: Get.find(), recommendedProductRepo: Get.find()),
      fenix: true);
}
