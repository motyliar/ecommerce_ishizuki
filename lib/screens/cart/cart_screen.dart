import 'widgets/widgets.dart';

import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cartScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        popArrow: false,
        imgName: 'images/cart_logo.png',
        isPop: true,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),

      //BODY

      body: const Column(
        children: [
          // Widget to show every single cart product //
          CartItemList(),
          // Show Dialog to user about DeliveryRules
          DeliveryDialog(),

          // Bottom widget of showing costs //
          BottomTotalPriceWidget()
        ],
      ),
    );
  }
}
