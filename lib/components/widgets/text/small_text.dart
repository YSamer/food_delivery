import 'package:flutter/material.dart';
import 'package:food_delivery/components/utils/colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color color;
  double size;
  double height;
  SmallText({
    super.key,
    required this.text,
    this.color = textColor,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: size, fontFamily: 'Roboto', height: height),
    );
  }
}
