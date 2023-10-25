import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class RowPrices extends StatelessWidget {
  final String text;
  final String prices;
  const RowPrices({required this.text, required this.prices, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            width: 80.0,
            child: Text(
              text,
              style: labelTextMidBlack,
            )),
        SizedBox(
          width: 10.0,
        ),
        SizedBox(
            width: 45,
            child: Text(
              prices,
              style: labelTextMidBlack,
            )),
      ],
    );
  }
}
