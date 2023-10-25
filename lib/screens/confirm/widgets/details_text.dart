import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class DetailsText extends StatelessWidget {
  final String title;
  final String text;

  const DetailsText({
    required this.title,
    required this.text,
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
          width: 10,
        ),
        Text(
          text,
          style: labelMidText,
        ),
      ],
    );
  }
}
