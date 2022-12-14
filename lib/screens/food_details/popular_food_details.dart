import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/products_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/dimensions.dart';
import 'package:food_delivery/core/widgets/mixed/app_icon.dart';
import 'package:food_delivery/core/widgets/mixed/app_column.dart';
import 'package:food_delivery/core/widgets/text/big_text.dart';
import 'package:food_delivery/core/widgets/text/expandable_text.dart';
import 'package:food_delivery/screens/cart/cart_screen.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final source_page = Get.arguments['page'];
    final source_index = Get.arguments['index'];
    var product =
        Get.find<ProductsController>().popularProductList.firstWhere((element) {
      if (element.id == index) {
        return true;
      } else {
        return false;
      }
    });
    Get.find<ProductsController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}/uploads/${product.img!}',
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (source_page == 'cart') {
                      Get.to(() => const CartScreen(),arguments: {'page': 'popular', 'index': product.id!},);
                    } else if (source_page == 'main') {
                      Get.to(() => const MainFoodPage());
                    }
                  },
                  child: const AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                GetBuilder<ProductsController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => const CartScreen(),
                          arguments: {'page': 'popular', 'index': product.id!},
                        );
                      },
                      child: Stack(
                        children: [
                          const AppIcon(icon: Icons.shopping_cart_outlined),
                          Get.find<ProductsController>().totalItems >= 1
                              ? const Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<ProductsController>().totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: Get.find<ProductsController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.popularFoodImgSize - 20,
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: 'Introduce'),
                  SizedBox(height: Dimensions.height20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableText(
                        text: product.description!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<ProductsController>(
        builder: (products) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius40),
                topRight: Radius.circular(Dimensions.radius40),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          products.setQuantity(false);
                        },
                        child: const Icon(Icons.remove, color: signColor),
                      ),
                      SizedBox(width: Dimensions.width5),
                      BigText(text: '${products.inCartItems}'),
                      SizedBox(width: Dimensions.width5),
                      GestureDetector(
                        onTap: () {
                          products.setQuantity(true);
                        },
                        child: const Icon(Icons.add, color: signColor),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    products.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: mainColor,
                    ),
                    child: BigText(
                      text: '\$${product.price!} | Add to Cart',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
