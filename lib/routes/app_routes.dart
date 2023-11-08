import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/screens/about/about_screen.dart';

import 'package:ecommerce_ishizuki/screens/network/network_checker.dart';
import 'package:ecommerce_ishizuki/screens/order/order_screen.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:ecommerce_ishizuki/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart' as route;

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is page ${settings.name}');

    switch (settings.name) {
      case route.kHomeScreen:
        return HomeScreen.route();
      case route.kNetworkScreen:
        return NetworkChecker.route();

      case route.kCategoryScreen:
        return CategoryScreen.route(category: settings.arguments as Category);
      case route.kProductScreen:
        return ProductScreen.route(product: settings.arguments as Product);
      case route.kCartScreen:
        return CartScreen.route();
      case route.kContactScreen:
        return ContactScreen.route();
      case route.kCustomScreen:
        return CustomOrderScreen.route();
      case route.kUserScreen:
        return UserScreen.route();
      case route.kConfirmScreen:
        return ConfirmScreen.route();
      case route.kAboutScreen:
        return AboutScreen.route();
      case route.kSplashScreen:
        return SplashScreen.route();
      case route.kOrderScreen:
        return OrderScreen.route();

      case route.kDeliveryScreen:
        return DeliveryScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
