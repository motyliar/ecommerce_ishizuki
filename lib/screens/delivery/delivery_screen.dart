import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/common/theme_data/box_decoration.dart';

import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../common/theme_data/config_exports.dart';

const double kSpaceBetweenWidgets = 20.0;
const double kBackgroundOpacity = 0.08;
const double kBoxShadowOffsetX = 1;
const double kBoxShadowOffsetY = 1;
const double kShadowOpacity = 0.2;
const double kDescriptionTextPaddingSides = 30.0;
const double kImageStackSizeWidth = 210.0;
const double kImageStackSizeHeight = 170.0;
const double kMaxWeightBoxWidth = 120.0;
const double kMaxWeightBoxPaddingTopBottom = 50.0;
const double kMaxWeightBoxPaddingSide = 8.0;
// max weight weight label
const kMaxWeightKG = '22 kg';
const kMaxWeightLBS = '48 lbs';

// values of image stack
const double kImageLeftPosition = 50.0;
const double kImageSizeShapeSquare = 170.0;
const double kImageStackLeftInscriptionPostionTop = 70.0;
const double kIMageStackBottomInscriptionPositionBottom = 10.0;
const double kIMageStackBottomInscriptionPositionLeft = 35.0;
const double kIMageStackRightInscriptionPositionBottom = 10.0;
const double kIMageStackRightInscriptionPositionRight = 30.0;
//dropdown button padding
const double kDropDownButtonPaddingSides = 8.0;
// prices label padding
const double kPricingLabelPaddingSides = 80.0;
// pricing table padding
const double kPriceTablePaddingRight = 40.0;
const double kPriceTablePaddingLeft = 30.0;

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kDeliveryScreen),
        builder: (_) => const DeliveryScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          popArrow: false,
          imgName: kAppBarMainLogo,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: Container(
          color: mainTextColor.withOpacity(kBackgroundOpacity),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: kSpaceBetweenWidgets,
              ),
              Center(
                  child: Container(
                color: backgroundColor,
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Text(
                  AppLocalizations.of(context)!.labelDelivery,
                  style: headText.copyWith(color: Colors.white),
                ),
              )),
              Divider(
                endIndent: kDividerDefaultIndent,
                indent: kDividerDefaultIndent,
                thickness: kDividerThickness,
              ),
              const SizedBox(
                height: kSpaceBetweenWidgets,
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: kMarginSideDefault, right: kMarginSideDefault),
                padding: const EdgeInsets.only(
                    top: kDefaultPadding, bottom: kDefaultPadding),
                decoration: BoxDecoration(
                    boxShadow: [deliveryBoxShadow],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kRadiusAppDefault)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: kDescriptionTextPaddingSides,
                      left: kDescriptionTextPaddingSides),
                  child: Text(
                      AppLocalizations.of(context)!.deliveryDescriptiion,
                      style: descriptionText),
                ),
              ),
              const Divider(
                endIndent: kDividerDefaultIndent,
                indent: kDividerDefaultIndent,
                thickness: kDividerThickness,
              ),
              const SizedBox(
                height: kDefaultSpaceBetweenWidgets,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin:
                                const EdgeInsets.only(left: kDefaultPadding),
                            padding: const EdgeInsets.only(
                                top: kMaxWeightBoxPaddingTopBottom,
                                bottom: kMaxWeightBoxPaddingTopBottom,
                                left: kMaxWeightBoxPaddingSide,
                                right: kMaxWeightBoxPaddingSide),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  deliveryBoxShadow,
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kRadiusAppDefault)),
                            width: kMaxWeightBoxWidth,
                            child: BlocBuilder<DeliveryCubit, DeliveryState>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(AppLocalizations.of(context)!
                                        .labelMaxWeight),
                                    Text(
                                      state.weight
                                          ? kMaxWeightKG
                                          : kMaxWeightLBS,
                                      style: headDeliveryText,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<DeliveryCubit>()
                                              .changeWeight();
                                        },
                                        icon: const Icon(
                                          Icons.change_circle,
                                          color: Colors.black,
                                        ))
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: kSpaceBetweenWidgets,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: kMarginSideDefault,
                            right: kMarginSideDefault),
                        padding: const EdgeInsets.only(
                            top: kDefaultPadding,
                            bottom: kDefaultPadding,
                            left: kDefaultPadding,
                            right: kDefaultPadding),
                        decoration: BoxDecoration(
                            boxShadow: [deliveryBoxShadow],
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(kRadiusAppDefault)),
                        child: BlocBuilder<DeliveryCubit, DeliveryState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.labelMaxSize,
                                  style: headTextEightTeen,
                                ),
                                SizedBox(
                                  width: kImageStackSizeWidth,
                                  height: kImageStackSizeHeight,
                                  child: Stack(children: [
                                    Positioned(
                                        top: 0,
                                        left: kImageLeftPosition,
                                        child: Image.network(
                                          kDeliveryCartoonImage,
                                          width: kImageSizeShapeSquare,
                                          height: kImageSizeShapeSquare,
                                        )),
                                    Positioned(
                                      top: kImageStackLeftInscriptionPostionTop,
                                      left: 0,
                                      child: Text(
                                        state.weight
                                            ? '$kDeliveryPackageWidthCm ${AppLocalizations.of(context)!.scaleCM}'
                                            : kDeliveryPackageWidthInch,
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                    Positioned(
                                      bottom:
                                          kIMageStackBottomInscriptionPositionBottom,
                                      left:
                                          kIMageStackBottomInscriptionPositionLeft,
                                      child: Text(
                                        state.weight
                                            ? '$kDeliveryPackageWidthCm ${AppLocalizations.of(context)!.scaleCM}'
                                            : kDeliveryPackageWidthInch,
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                    Positioned(
                                      bottom:
                                          kIMageStackRightInscriptionPositionBottom,
                                      right:
                                          kIMageStackRightInscriptionPositionRight,
                                      child: Text(
                                        state.weight
                                            ? '$kDeliveryPackageLongCm ${AppLocalizations.of(context)!.scaleCM}'
                                            : '$kDeliveryPackageLongInch',
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - kMarginSideDefault,
                child: Column(children: [
                  const SizedBox(
                    height: kDefaultSpaceBetweenWidgets,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: kMarginSideDefault, right: kMarginSideDefault),
                    padding: const EdgeInsets.only(
                        top: kDefaultPadding,
                        bottom: kDefaultPadding,
                        left: kPricingLabelPaddingSides,
                        right: kPricingLabelPaddingSides),
                    decoration: BoxDecoration(
                        boxShadow: [deliveryBoxShadow],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(kRadiusAppDefault)),
                    child: Text(
                      AppLocalizations.of(context)!.labelPrices,
                      style: headTextMid,
                    ),
                  ),
                  const Divider(
                    endIndent: kDividerDefaultIndent,
                    indent: kDividerDefaultIndent,
                    thickness: kDividerThickness,
                  ),
                  BlocBuilder<DeliveryCubit, DeliveryState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: kMarginSideDefault,
                                bottom: kMarginSideDefault),
                            padding: const EdgeInsets.only(
                                top: kDefaultPadding,
                                bottom: kDefaultPadding,
                                left: kPriceTablePaddingLeft,
                                right: kPriceTablePaddingRight),
                            decoration: BoxDecoration(
                                boxShadow: [deliveryBoxShadow],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kRadiusAppDefault)),
                            child: Column(
                              children: [
                                RowPrices(
                                  text: state.weight
                                      ? '$kDeliveryMinimumWeightKg ${AppLocalizations.of(context)!.scaleKG}'
                                      : '$kDeliveryMinimumWeightLbs${AppLocalizations.of(context)!.scaleLBS}',
                                  prices:
                                      '${kDeliveryPricesList[state.pricesIndex][0]}\$',
                                ),
                                RowPrices(
                                  text: state.weight
                                      ? '$kDeliveryMediumWeightKg${AppLocalizations.of(context)!.scaleKG}'
                                      : '$kDeliveryMediumWeightLbs${AppLocalizations.of(context)!.scaleLBS}',
                                  prices:
                                      '${kDeliveryPricesList[state.pricesIndex][1]}\$',
                                ),
                                RowPrices(
                                  text: state.weight
                                      ? '$kDeliveryHighWeightKg${AppLocalizations.of(context)!.scaleKG}'
                                      : '$kDeliveryHighWeightLbs${AppLocalizations.of(context)!.scaleLBS}',
                                  prices:
                                      '${kDeliveryPricesList[state.pricesIndex][2]} \$',
                                ),
                                RowPrices(
                                    text: state.weight
                                        ? '$kDeliveryMaximumWeightKg${AppLocalizations.of(context)!.scaleKG}'
                                        : '$kDeliveryMaximumWeightLbs${AppLocalizations.of(context)!.scaleLBS}',
                                    prices:
                                        '${kDeliveryPricesList[state.pricesIndex][3]} \$')
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: kMarginSideDefault,
                                right: kMarginSideDefault),
                            padding: const EdgeInsets.only(
                                top: kDefaultPadding,
                                bottom: kDefaultPadding,
                                left: kDropDownButtonPaddingSides,
                                right: kDropDownButtonPaddingSides),
                            decoration: BoxDecoration(
                                boxShadow: [deliveryBoxShadow],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(kRadiusAppDefault)),
                            child: DropdownButton(
                              items: Utils().generateDropDownMenuItemList(
                                  kDeliveryWorldPlaceChoose),
                              value: state.pricesValue,
                              onChanged: (value) {
                                context
                                    .read<DeliveryCubit>()
                                    .changeCountry(value!);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ]),
              )
            ]),
          ),
        ));
  }
}
