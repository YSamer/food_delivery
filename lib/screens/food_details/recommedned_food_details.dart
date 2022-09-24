import 'package:flutter/material.dart';
import 'package:food_delivery/components/utils/colors.dart';
import 'package:food_delivery/components/utils/dimensions.dart';
import 'package:food_delivery/components/widgets/mixed/app_icon.dart';
import 'package:food_delivery/components/widgets/text/big_text.dart';
import 'package:food_delivery/components/widgets/text/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
                child: Center(
                    child: BigText(
                  text: 'Chinese Cuisines',
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/image/food0.png',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  child: ExpandableText(
                    text:
                        '''Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal. Chinese cuisines seem to have mastered this art; hence you find most of their meals are accompanied by different side dishes. The side dishes could be a variety of raw or simple veggies to potato or soups or just anything that compliments or balance the main meal.''',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width45,
              right: Dimensions.width45,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.size24,
                ),
                BigText(
                  text: '\$12.88 X 0',
                  color: mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.size24,
                ),
              ],
            ),
          ),
          Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: mainColor,
                    )),
                Container(
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
                    text: '\$10 | Add to Cart',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
