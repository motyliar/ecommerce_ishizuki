import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String textToDisplay;
  final double textContainerWidthSize;
  final double textPadding;
  const TextContainer({
    required this.textToDisplay,
    required this.textContainerWidthSize,
    this.textPadding = kAboutTextPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadeBox,
      width: textContainerWidthSize,
      child: Padding(
        padding: EdgeInsets.all(textPadding),
        child: Text(
          textToDisplay,
          style: descriptionText,
        ),
      ),
    );
  }
}
