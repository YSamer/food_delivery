import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/products_controller.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/dimensions.dart';
import 'package:food_delivery/core/widgets/mixed/app_icon.dart';
import 'package:food_delivery/core/widgets/text/big_text.dart';
import 'package:food_delivery/core/widgets/text/small_text.dart';
import 'package:food_delivery/screens/food_details/popular_food_details.dart';
import 'package:food_delivery/screens/food_details/recommedned_food_details.dart';
import 'package:food_delivery/screens/home/main_food_page.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final source_page = Get.arguments['page'];
    final source_index = Get.arguments['index'];
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (source_page == 'recommended') {
                      Get.to(
                        () => RecommendedFoodDetails(index: source_index),
                        arguments: {'page': 'cart', 'index': source_index},
                      );
                    } else if (source_page == 'popular') {
                      Get.to(
                        () => PopularFoodDetails(index: source_index),
                        arguments: {'page': 'cart', 'index': source_index},
                      );
                    } else {
                      Get.to(() => const MainFoodPage());
                    }
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    backgroundColor: mainColor,
                    iconSize: Dimensions.size24,
                    iconColor: Colors.white,
                  ),
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    backgroundColor: mainColor,
                    iconSize: Dimensions.size24,
                    iconColor: Colors.white,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  backgroundColor: mainColor,
                  iconSize: Dimensions.size24,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              GetBuilder<ProductsController>(
                                builder: (controller) {
                                  return GestureDetector(
                                    onTap: () {
                                      var productIndex =
                                          _cartList[index].product!.id;
                                      if (controller.popularProductList
                                          .contains(
                                              _cartList[index].product!)) {
                                        Get.to(
                                          () => PopularFoodDetails(
                                              index: productIndex!),
                                          arguments: {
                                            'page': 'cart',
                                            'index': productIndex
                                          },
                                        );
                                      } else if (controller
                                          .recommendedProductList
                                          .contains(
                                              _cartList[index].product!)) {
                                        Get.to(
                                          () => RecommendedFoodDetails(
                                              index: productIndex!),
                                          arguments: {
                                            'page': 'cart',
                                            'index': productIndex
                                          },
                                        );
                                      } else {
                                        Get.to(() => const MainFoodPage());
                                      }
                                    },
                                    child: Container(
                                      width: Dimensions.height20 * 5,
                                      height: Dimensions.height20 * 5,
                                      margin: EdgeInsets.only(
                                        bottom: Dimensions.height10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              '${AppConstants.BASE_URL}/uploads/${cartController.getItems[index].img!}'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: Dimensions.width10),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: _cartList[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: 'Spicy'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text:
                                                '${_cartList[index].price!} \$',
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical: Dimensions.width10,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                Dimensions.radius20,
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                    //popularProduct.setQuantity(false);
                                                  },
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color: signColor),
                                                ),
                                                SizedBox(
                                                    width: Dimensions.width5),
                                                BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString()), //'${popularProduct.inCartItems}'),
                                                SizedBox(
                                                    width: Dimensions.width5),
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                    // popularProduct.setQuantity(true);
                                                  },
                                                  child: const Icon(Icons.add,
                                                      color: signColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) {
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
                      SizedBox(width: Dimensions.width5),
                      BigText(text: '\$ ${controller.totalAmount}'),
                      SizedBox(width: Dimensions.width5),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.addToHistory();
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
                      text: 'Check out',
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
