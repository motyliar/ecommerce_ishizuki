import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';

const double kDescriptionRowWidth = 250.0;

class DescriptionRow extends StatelessWidget {
  final String rightLabel;
  final String leftLabel;
  final double descriptionRowWidth;
  const DescriptionRow(
      {super.key,
      required this.rightLabel,
      required this.leftLabel,
      this.descriptionRowWidth = kDescriptionRowWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          rightLabel,
          style: descriptionText,
        ),
        Container(
          width: kDescriptionRowWidth,
          child: Text(
            leftLabel,
            style: descriptionText,
          ),
        ),
      ],
    );
  }
}
