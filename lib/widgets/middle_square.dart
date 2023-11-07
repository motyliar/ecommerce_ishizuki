import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class MiddleSquare extends StatelessWidget {
  final String route;
  final String text;
  final double overallWidth;
  final double overalHeight;
  final double borderRadius;
  final double shadeOpacity;
  final double blurRadius;
  final double spreadRadius;
  final double shadeOffsetX;
  final double shadeOffsetY;
  const MiddleSquare({
    required this.route,
    required this.text,
    this.borderRadius = kRadiusAppDefault,
    this.shadeOpacity = kMediumOpacity,
    super.key,
    this.overallWidth = kMiddleButtonWidth,
    this.overalHeight = kMiddleButtonHeight,
    this.blurRadius = kBlurRadiusDefault,
    this.spreadRadius = kSpreadRadiusDefault,
    this.shadeOffsetX = kShadeOffsetXDefault,
    this.shadeOffsetY = kShadeOffsetYDefault,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
              width: overallWidth,
              height: overalHeight,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: blurRadius,
                        spreadRadius: spreadRadius,
                        color: Colors.grey.withOpacity(shadeOpacity),
                        offset: Offset(shadeOffsetX, shadeOffsetY)),
                  ],
                  gradient: LinearGradient(colors: [
                    mainTextColor.withOpacity(shadeOpacity),
                    backgroundColor,
                    mainTextColor.withOpacity(shadeOpacity)
                  ], begin: Alignment.topCenter),
                  color: mainTextColor.withOpacity(shadeOpacity),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius))),
              child: Center(
                child: Text(
                  text,
                  style: labelTextMidBlack,
                ),
              )),
        ],
      ),
    );
  }
}
