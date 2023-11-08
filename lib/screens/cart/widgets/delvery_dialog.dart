import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/screens/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DeliveryDialog extends StatelessWidget {
  final double alertDialogSizeSquareShape;
  final double deliveryMessageLabelPaddingLeft;
  final double deliveryMessageLabelPaddingBottom;
  final double deliveryMessageIconWidthSpace;
  final double textDescriptionMaximumWdth;
  final double titleTopPostion;
  final double titleLeftPostion;
  final double descriptionTopPosition;

  const DeliveryDialog({
    this.alertDialogSizeSquareShape = kCartDeliveryDimensionOfDialog,
    this.deliveryMessageLabelPaddingLeft = kSidesDefaultPadding,
    this.deliveryMessageLabelPaddingBottom = kDefaultPadding,
    this.deliveryMessageIconWidthSpace = kDefaultPadding,
    this.textDescriptionMaximumWdth = kCartDeliveryDimensionOfDialog,
    this.titleTopPostion = 5,
    this.titleLeftPostion = 20,
    this.descriptionTopPosition = 50,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(DeliveryAgreeEvent());
                        Navigator.pop(context);
                      },
                      child: AlertDialog(
                        backgroundColor: backgroundColor,
                        title: Container(
                          width: alertDialogSizeSquareShape,
                          height: alertDialogSizeSquareShape,
                          color: backgroundColor,
                          child: Stack(children: [
                            Positioned(
                                top: titleTopPostion,
                                left: titleLeftPostion,
                                child: Text(
                                  AppLocalizations.of(context)!
                                      .alertDeliveryRules,
                                  style: labelText,
                                )),
                            Positioned(
                                top: descriptionTopPosition,
                                child: SizedBox(
                                  width: textDescriptionMaximumWdth,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .alertDeliveryDescription,
                                    style: labelAlertText,
                                  ),
                                )),
                          ]),
                        ),
                      ));
                },
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: deliveryMessageLabelPaddingLeft,
            bottom: deliveryMessageLabelPaddingBottom),
        child: Row(
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Text(
                    AppLocalizations.of(context)!.alertDeliveryButton,
                    style: state.deliveryAgree
                        ? labelTextMidBlack
                        : labelTextMidBlack.copyWith(color: Colors.red),
                  );
                } else {
                  return const ErrorScreen();
                }
              },
            ),
            SizedBox(
              width: deliveryMessageIconWidthSpace,
            ),
            const Icon(Icons.local_shipping)
          ],
        ),
      ),
    );
  }
}
