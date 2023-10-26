import 'dart:async';

import 'package:ecommerce_ishizuki/config/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, '/'));
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.network(
                'http://motyliar.webd.pro/.sharedphotos/ishizuki_logo.png',
                width: 270,
                height: 235,
              ),
            )
          ],
        ),
      )),
    );
  }
}
