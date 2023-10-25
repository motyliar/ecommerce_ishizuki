import 'dart:async';

import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/colors.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/order';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const OrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.pushNamed(context, '/');
      timer.cancel();
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(child: BlocBuilder<ConfirmBloc, ConfirmState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                      color: mainTextColor.withOpacity(0.5),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, -2),
                            blurRadius: 10,
                            spreadRadius: 10,
                            color: Colors.grey.withOpacity(0.3))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Thank you ${state.address.name}!',
                        style: headText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Your order is getting ready',
                        style: labelText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Text(
                          'We\'ll procced your order and will comeback to you with shipping cost and Payment method on your email: ${state.address.email}. That can take us about 24h, ',
                          style: labelMidText,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Your order:   ',
                              style: labelMidText,
                              children: <TextSpan>[
                            TextSpan(
                                text: '${state.orderSymbol}',
                                style: labelText.copyWith(
                                    fontSize: 18, color: Colors.amber))
                          ])),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
