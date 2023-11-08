import 'dart:async';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

// dimensions sizes of main container
const double kDimensionOfMainView = 300.0;
const double kTopMarginSpace = 35.0;
const double kEmailTextPaddingSides = 15.0;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kOrderScreen),
        builder: (_) => const OrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.pushNamed(context, kHomeScreen);
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
                  width: kDimensionOfMainView,
                  height: kDimensionOfMainView,
                  decoration: BoxDecoration(
                      color: mainTextColor.withOpacity(kMediumOpacity),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(kRadiusAppDefault)),
                      boxShadow: [orderScreenBoxShadow]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kTopMarginSpace,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .thankYou(state.address.name),
                        style: headText.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: kDefaultSpaceBetweenWidgets,
                      ),
                      Text(
                        AppLocalizations.of(context)!.orderGettingReadyMessage,
                        style: labelText,
                      ),
                      const SizedBox(
                        height: kDefaultSpaceBetweenWidgets,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: kEmailTextPaddingSides,
                            left: kEmailTextPaddingSides),
                        child: Text(
                          AppLocalizations.of(context)!
                              .orderEmailMessage(state.address.email),
                          style: labelMidText,
                        ),
                      ),
                      const SizedBox(
                        height: kDefaultSpaceBetweenWidgets,
                      ),
                      RichText(
                          text: TextSpan(
                              text: AppLocalizations.of(context)!
                                  .orderYourOrderLabel,
                              style: labelMidText,
                              children: <TextSpan>[
                            TextSpan(
                                text: '${state.orderSymbol}',
                                style: orderNumberTextStyle)
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
