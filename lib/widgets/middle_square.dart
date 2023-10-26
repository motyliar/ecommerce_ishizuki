import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class MiddleSquare extends StatelessWidget {
  final String route;
  final String text;
  const MiddleSquare({
    required this.route,
    required this.text,
    super.key,
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
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, -3)),
                  ],
                  gradient: LinearGradient(colors: [
                    mainTextColor.withOpacity(0.5),
                    backgroundColor,
                    mainTextColor.withOpacity(0.5)
                  ], begin: Alignment.topCenter),
                  color: mainTextColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  text,
                  style: labelTextMidBlack,
                  maxLines: 2,
                ),
              )),
        ],
      ),
    );
  }
}
