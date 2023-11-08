import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

const double kWeightBoxWidth = 80.0;
const double kPricesBoxWidth = 45.0;

class RowPrices extends StatelessWidget {
  final String text;
  final String prices;
  final double weightTextsWidth;
  final double spaceBetweenText;
  final double priceTextsWidth;
  const RowPrices(
      {required this.text,
      required this.prices,
      this.weightTextsWidth = kWeightBoxWidth,
      this.spaceBetweenText = kDefaultSpaceBetweenWidgets,
      this.priceTextsWidth = kPricesBoxWidth,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: weightTextsWidth,
            child: Text(
              text,
              style: labelTextMidBlack,
            )),
        SizedBox(
          width: spaceBetweenText,
        ),
        SizedBox(
            width: priceTextsWidth,
            child: Text(
              prices,
              style: labelTextMidBlack,
            )),
      ],
    );
  }
}
