import 'package:flutter/material.dart';
import 'package:food_delivery/components/utils/colors.dart';
import 'package:food_delivery/components/utils/dimensions.dart';
import 'package:food_delivery/components/widgets/mixed/icon_and_text.dart';
import 'package:food_delivery/components/widgets/text/big_text.dart';
import 'package:food_delivery/components/widgets/text/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  color: mainColor,
                  size: 15,
                ),
              ),
            ),
            SizedBox(width: Dimensions.width10),
            SmallText(text: '4.5'),
            SizedBox(width: Dimensions.width10),
            SmallText(text: '128'),
            SizedBox(width: Dimensions.width5),
            SmallText(text: 'Comments'),
          ],
        ),
        SizedBox(height: Dimensions.height15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
