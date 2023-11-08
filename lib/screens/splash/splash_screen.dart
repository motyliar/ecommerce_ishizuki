import 'dart:async';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/config/colors.dart';
import 'package:flutter/material.dart';

// SPLASH SCREEN CONSTANS
const double kSplashCenterImageWidth = 270.0;
const double kSpalshCenterImageHeight = 235.0;

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kSplashScreen),
        builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, kNetworkScreen));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: kSidesDefaultPadding),
              child: Image.network(
                kSplashScreenMiddleLogo,
                width: kSplashCenterImageWidth,
                height: kSpalshCenterImageHeight,
              ),
            )
          ],
        ),
      )),
    );
  }
}
