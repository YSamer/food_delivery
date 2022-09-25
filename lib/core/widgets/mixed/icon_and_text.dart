import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';
import 'package:food_delivery/core/utils/dimensions.dart';
import 'package:food_delivery/core/widgets/text/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  Color textcolor;
  final Color iconColor;
  IconAndText(
      {super.key,
      required this.icon,
      required this.text,
      this.textcolor = textColor,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.size24,
        ),
        SizedBox(width: Dimensions.width5),
        SmallText(text: text, color: textColor),
      ],
    );
  }
}
