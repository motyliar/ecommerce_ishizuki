import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: shadeBox,
      width: MediaQuery.of(context).size.width / 2 - 23,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: labelTextMidBlack.copyWith(fontSize: 14),
        ),
      ),
    );
  }
}
