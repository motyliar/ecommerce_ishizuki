import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/screens/about/about_screen.dart';
import 'package:ecommerce_ishizuki/screens/confirm/confirm_screen.dart';
import 'package:ecommerce_ishizuki/screens/delivery/delivery_screen.dart';
import 'package:ecommerce_ishizuki/screens/order/order_screen.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is page ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case '/categoryScreen':
        return CategoryScreen.route(category: settings.arguments as Category);
      case '/productScreen':
        return ProductScreen.route(product: settings.arguments as Product);
      case '/cartScreen':
        return CartScreen.route();
      case '/contactScreen':
        return ContactScreen.route();
      case '/customOrderScreen':
        return CustomOrderScreen.route();
      case '/userScreen':
        return UserScreen.route();
      case '/confirmScreen':
        return ConfirmScreen.route();
      case '/about':
        return AboutScreen.route();

      case '/order':
        return OrderScreen.route();

      case '/delivery':
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
