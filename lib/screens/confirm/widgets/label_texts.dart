import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class LabelTexts extends StatelessWidget {
  final String title;
  final double textPaddingLeft;
  final double textPaddingTop;
  const LabelTexts({
    required this.title,
    this.textPaddingLeft = kLabelTextPadding,
    this.textPaddingTop = kLabelTextPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: textPaddingLeft, top: textPaddingTop),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: headTextEightTeen,
        ),
      ),
    );
  }
}
