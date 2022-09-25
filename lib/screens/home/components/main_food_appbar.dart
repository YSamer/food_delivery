import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/dimensions.dart';
import 'package:food_delivery/core/widgets/text/big_text.dart';
import 'package:food_delivery/core/widgets/text/small_text.dart';

class MainFoodAppBar extends StatelessWidget {
  const MainFoodAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.height20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(text: 'Bangladesh', color: mainColor),
              Row(
                children: [
                  SmallText(text: 'Narsingdi', color: Colors.black54),
                  const Icon(Icons.arrow_drop_down_rounded),
                ],
              ),
            ],
          ),
          Center(
            child: Container(
              height: Dimensions.height45,
              width: Dimensions.width45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                color: mainColor,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: Dimensions.size24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
