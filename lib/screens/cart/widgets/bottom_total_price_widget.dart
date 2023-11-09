import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class BottomTotalPriceWidget extends StatelessWidget {
  final Function() snackBarMessage;
  final List<DropdownMenuItem<String>> dropdownListGenerate;
  final double rowProductPadding;
  final double dividerThickness;
  final double dividerIndents;
  final double spaceBetweenWidgetsHeight;
  final double bottomButtonMargin;
  final double bottomButtonPadding;

  const BottomTotalPriceWidget({
    required this.snackBarMessage,
    required this.dropdownListGenerate,
    this.rowProductPadding = kSidesDefaultPadding,
    this.dividerThickness = kDividerThickness,
    this.dividerIndents = kDividerDefaultIndent,
    this.spaceBetweenWidgetsHeight = kDefaultSpaceBetweenWidgets,
    this.bottomButtonMargin = kDefaultPadding,
    this.bottomButtonPadding = kDefaultPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: spaceBetweenWidgetsHeight,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: rowProductPadding, right: rowProductPadding),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.isVisible
                                ? AppLocalizations.of(context)!
                                    .bottomInactiveDeliveryMessage
                                : AppLocalizations.of(context)!
                                    .bottomActiveDeliveryMessage,
                            style: labelText,
                          ),
                          state.isVisible
                              ? Text(
                                  state.cart.getDeliveryPrice,
                                  style: labelText,
                                )
                              : DropdownButton(
                                  dropdownColor: backgroundColor,
                                  items: dropdownListGenerate,
                                  style: labelText,
                                  value: state.cart.value,
                                  onChanged: (value) {
                                    context
                                        .read<CartBloc>()
                                        .add(DeliveryValueEvent(value: value!));
                                  }),
                        ]);
                  } else {
                    return const ErrorScreen();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: rowProductPadding, right: rowProductPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bottomProductPriceMessage,
                    style: labelText,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return Text(
                          state.cart.getCurrencyPricing,
                          style: labelText,
                        );
                      }
                      return const ErrorScreen();
                    },
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white,
              endIndent: dividerIndents,
              indent: dividerIndents,
              thickness: dividerThickness,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: rowProductPadding, right: rowProductPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bottomTotalPriceMessage,
                    style: labelText,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return Text(
                          state.cart.getTotalPricing,
                          style: labelText,
                        );
                      } else {
                        return const ErrorScreen();
                      }
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<CartBloc, CartState>(listener: (context, state) {
              if (state is CartLoaded) {}
            }, builder: (context, state) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartError) {
                    return (const Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  if (state is CartLoaded) {
                    BlocProvider.of<ConfirmBloc>(context)
                        .add(GetCartEvent(cart: state.cart));
                    return state.cart.products.isEmpty
                        ? Container()
                        : Container(
                            margin: EdgeInsets.only(top: bottomButtonMargin),
                            padding: EdgeInsets.all(bottomButtonPadding),
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                state.deliveryAgree
                                    ? Navigator.pushNamed(
                                        context, kConfirmScreen)
                                    : snackBarMessage();
                              },
                              child: Text(
                                AppLocalizations.of(context)!
                                    .bottomButtonConfirm
                                    .toUpperCase(),
                                style: headText,
                              ),
                            ),
                          );
                  } else {
                    return const ErrorScreen();
                  }
                },
              );
            }),
          ],
        ));
  }
}
