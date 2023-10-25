import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class DescriptionRow extends StatelessWidget {
  final String rightLabel;
  final String leftLabel;
  const DescriptionRow(
      {super.key, required this.rightLabel, required this.leftLabel});

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
          width: 250,
          child: Text(
            leftLabel,
            style: descriptionText,
          ),
        ),
      ],
    );
  }
}
