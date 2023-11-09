import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter/material.dart';

class NetworkInitWidget extends StatelessWidget {
  const NetworkInitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: backgroundColor,
    )));
  }
}
