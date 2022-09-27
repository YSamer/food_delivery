import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/core/routes/routes.dart';
import 'package:food_delivery/core/utils/app_constants.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/dimensions.dart';
import 'package:food_delivery/core/widgets/mixed/app_column.dart';
import 'package:food_delivery/core/widgets/mixed/icon_and_text.dart';
import 'package:food_delivery/core/widgets/text/big_text.dart';
import 'package:food_delivery/core/widgets/text/small_text.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/models/products_model.dart';
import 'package:food_delivery/screens/food_details/popular_food_details.dart';
import 'package:food_delivery/screens/food_details/recommedned_food_details.dart';
import 'package:get/get.dart';

class MainFoodBody extends StatefulWidget {
  const MainFoodBody({super.key});

  @override
  State<MainFoodBody> createState() => _MainFoodBodyState();
}

class _MainFoodBodyState extends State<MainFoodBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;
  final double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            var products = popularProducts.popularProductList;
            return popularProducts.isLoaded
                ? SizedBox(
                    height: Dimensions.pageView,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return BuildFoodItem(index, products[index]);
                      },
                    ),
                  )
                : const CircularProgressIndicator(color: mainColor);
          },
        ),
        //Dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            var products = popularProducts.popularProductList;
            return DotsIndicator(
              dotsCount: products.isEmpty ? 1 : products.length,
              position: _currPageValue,
              decorator: DotsDecorator(
                activeColor: mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius5),
                ),
              ),
            );
          },
        ),
        //Popular
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Recommended'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: 'Food pairing'),
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.height20),
        //List of foods
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProducts) {
            var products = recommendedProducts.recommendedProductList;
            return recommendedProducts.isLoaded
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            () => RecommendedFoodDetails(
                                index: products[index].id!),
                            arguments: {
                              'page': 'main',
                              'index': products[index].id!
                            },
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                            bottom: Dimensions.height10,
                          ),
                          child: Row(
                            children: [
                              //Image
                              Container(
                                width: Dimensions.listViewImgSize,
                                height: Dimensions.listViewImgSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      '${AppConstants.BASE_URL}/uploads/${products[index].img!}',
                                    ),
                                  ),
                                ),
                              ),
                              //Text
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(Dimensions.radius20),
                                      bottomRight:
                                          Radius.circular(Dimensions.radius20),
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      left: Dimensions.width10,
                                      right: Dimensions.width10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        BigText(
                                          text: products[index].name!,
                                        ),
                                        SizedBox(height: Dimensions.height10),
                                        SmallText(
                                            text:
                                                'With Chinese characteristics'),
                                        SizedBox(height: Dimensions.height15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconAndText(
                                              icon: Icons.circle_sharp,
                                              text: 'Normal',
                                              iconColor: iconColor1,
                                            ),
                                            IconAndText(
                                              icon: Icons.location_on,
                                              text: '1.7km',
                                              iconColor: mainColor,
                                            ),
                                            IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: '32min',
                                              iconColor: iconColor2,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : const CircularProgressIndicator(color: mainColor);
          },
        )
      ],
    );
  }

  Widget BuildFoodItem(int index, ProductModel product) {
    double height = Dimensions.pageViewContainer;
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageValue.floor()) {
      double currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      double currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      double currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      double currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      double currScale = 0.8;
      double currTrans = height * (1 - _scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 1);
    }

    return GestureDetector(
      onTap: () {
        Get.to(
          () => PopularFoodDetails(index: product.id!),
          arguments: {'page': 'main', 'index': product.id!},
        );
      },
      child: Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: mainColor,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${AppConstants.BASE_URL}/uploads/${product.img!}',
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                  right: Dimensions.width25,
                  left: Dimensions.width25,
                  bottom: Dimensions.height25,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFE8E8E8),
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.width15,
                    vertical: Dimensions.height15,
                  ),
                  child: AppColumn(text: product.name!),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
