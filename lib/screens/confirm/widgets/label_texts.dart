import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class LabelTexts extends StatelessWidget {
  final String title;
  const LabelTexts({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 15.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: headText.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}
