import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';

class DetailsText extends StatelessWidget {
  final String title;
  final String text;
  final double betweenTextSpace;

  const DetailsText({
    required this.title,
    required this.text,
    this.betweenTextSpace = kDefaultSpaceBetweenWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: label16Text,
        ),
        SizedBox(
          width: betweenTextSpace,
        ),
        Text(
          text,
          style: labelMidText,
        ),
      ],
    );
  }
}
