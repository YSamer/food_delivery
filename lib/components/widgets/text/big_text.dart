import 'package:flutter/material.dart';
import 'package:food_delivery/components/utils/colors.dart';
import 'package:food_delivery/components/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  TextOverflow overflow;
  BigText({
    super.key,
    required this.text,
    this.color = mainBlackColor,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      maxLines: 1,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
