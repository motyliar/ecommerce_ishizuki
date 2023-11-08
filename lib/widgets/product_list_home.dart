import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

const double kProductDisplayImageSquareSize = 150.0;
const double kProductIconCartSize = 35.0;
const double kProductBackgroundOpacity = 0.07;

// value for keeping icon in const space
const double kProductIconSpace = 45.0;

class ProductListHome extends StatelessWidget {
  final Product product;
  final double widgetPadding;
  final double borderRadius;
  final double shadeBoxOpacity;
  final double sizedBoxHeigth;
  final double productImageSquareSize;
  final int durationInSeconds;
  final double backgroundOpacity;
  final double customPaddingBorder;
  final double iconCartSize;
  final double distanceIconFromImage;
  final double iconSpaces;

  const ProductListHome(
      {required this.product,
      this.customPaddingBorder = 10.0,
      this.widgetPadding = kDefaultPadding,
      this.borderRadius = kRadiusAppDefault,
      this.shadeBoxOpacity = kProductBackgroundOpacity,
      this.productImageSquareSize = kProductDisplayImageSquareSize,
      this.durationInSeconds = kDefaultDurationINSeconds,
      this.backgroundOpacity = kMediumOpacity,
      this.sizedBoxHeigth = kAvarageMediumPaddingOrMargin,
      this.iconCartSize = kProductIconCartSize,
      this.distanceIconFromImage = kProductIconCartSize,
      this.iconSpaces = kProductIconSpace,
      super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GaleryBloc, GaleryState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(customPaddingBorder),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, kProductScreen, arguments: product);
              context
                  .read<GaleryBloc>()
                  .add(GaleryLoadingEvent(image: product.imgUrl, index: 0));
            },
            child: Container(
              padding: EdgeInsets.all(customPaddingBorder),
              decoration: shadeBox.copyWith(
                  color: mainTextColor.withOpacity(shadeBoxOpacity)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  ${product.name}',
                          style: labelTextMidBlack.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Container(
                          decoration:
                              shadeBox.copyWith(color: Colors.transparent),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(borderRadius),
                                topRight: Radius.circular(borderRadius)),
                            child: Image.network(
                              product.imgUrl[0],
                              width: productImageSquareSize,
                              height: productImageSquareSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            product.isNew
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(right: sizedBoxHeigth),
                                    child: Container(
                                      padding: EdgeInsets.all(widgetPadding),
                                      color: pallet4
                                          .withOpacity(backgroundOpacity),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .newDisplay,
                                        style: labelText.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow),
                                      ),
                                    ),
                                  )
                                : Container(),
                            BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AddCartEvent(product: product));
                                    Utils.snackBarMessage(
                                        context,
                                        AppLocalizations.of(context)!
                                            .snackbarAddToCartMessage(
                                                product.name));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(widgetPadding),
                                    height: iconSpaces,
                                    width: iconSpaces,
                                    color: backgroundColor
                                        .withOpacity(backgroundOpacity),
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      size: iconCartSize,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: distanceIconFromImage,
                        ),
                        Container(
                          padding: EdgeInsets.all(widgetPadding),
                          color: mainTextColor.withOpacity(backgroundOpacity),
                          child: Text(
                              'Price: ${product.getStringPrice(context, product)} ',
                              style: labelTwentyTwoText),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}
