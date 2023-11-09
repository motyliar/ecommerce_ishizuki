import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';

// stack widget initial dimension
const double kProductStackInitialSizeWidth = 250.0;
const double kProductStackInitialSizeHeight = 220.0;
// product image size
const double kImageProductSizeSquare = 200.0;
// position in Stack
const double kImagePositionTop = 25.0;
const double kImagePositionLeft = 30.0;

const double kLabelsBackgroundOpacity = 0.7;
// new label positions
const double kNewLabelPosition = 10.0;
// price label position
const double kPriceLabelPositionBottom = 20.0;
const double kPriceLabelPositionLeft = 5.0;
// add to cart button position
const double kAddToCartButtonPosition = 75.0;
// sold label opacity and position
const double kSoldLabelBackgroundOpacity = 0.4;
const double kSoldLabelPositionTop = 28.0;
const double kSoldLabelPositionLeft = 40.0;

class ProductListWidget extends StatelessWidget {
  final double sizeOfImage;
  final double iconSize;
  final double productStackInitialWidth;
  final double productStackInitialHeight;
  final double imagePositionTop;
  final double imagePositionLeft;
  final double labelBackgroundOpacity;

  final bool isSold;
  final Product product;
  const ProductListWidget({
    this.iconSize = 30,
    this.sizeOfImage = kImageProductSizeSquare,
    this.productStackInitialWidth = kProductStackInitialSizeWidth,
    this.productStackInitialHeight = kProductStackInitialSizeHeight,
    this.imagePositionTop = kImagePositionTop,
    this.imagePositionLeft = kImagePositionLeft,
    this.labelBackgroundOpacity = kLabelsBackgroundOpacity,
    required this.product,
    required this.isSold,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GaleryBloc, GaleryState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, kProductScreen, arguments: product);
            context
                .read<GaleryBloc>()
                .add(GaleryLoadingEvent(image: product.imgUrl, index: 0));
          },
          child: Stack(
            children: [
              SizedBox(
                width: productStackInitialWidth,
                height: productStackInitialHeight,
              ),
              Positioned(
                left: imagePositionLeft,
                top: imagePositionTop,
                child: Image.network(
                  product.imgUrl[0],
                  width: sizeOfImage,
                  height: sizeOfImage,
                ),
              ),
              product.isSold
                  ? Positioned(
                      top: kSoldLabelPositionTop,
                      left: kSoldLabelPositionLeft,
                      child: Container(
                        width: sizeOfImage - kAvarageMediumPaddingOrMargin,
                        height: sizeOfImage - kAvarageMediumPaddingOrMargin,
                        color: Colors.black
                            .withOpacity(kSoldLabelBackgroundOpacity),
                        child: Center(
                            child: Container(
                          color: labelColor,
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Text(
                            AppLocalizations.of(context)!.sold.toUpperCase(),
                            style: labelText,
                          ),
                        )),
                      ))
                  : Container(),
              Positioned(
                top: 5,
                left: 10,
                child: Container(
                  color: backgroundColor.withOpacity(labelBackgroundOpacity),
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Text(
                    product.name,
                    style: labelMidText,
                  ),
                ),
              ),
              product.isSold
                  ? Container()
                  : BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return Positioned(
                          top: kAddToCartButtonPosition,
                          right: kAddToCartButtonPosition,
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CartBloc>()
                                  .add(AddCartEvent(product: product));
                              Utils.snackBarMessage(context, product.name);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              height: iconSize + kMarginSideDefault,
                              width: iconSize + kMarginSideDefault,
                              color: backgroundColor
                                  .withOpacity(labelBackgroundOpacity),
                              child: Icon(
                                Icons.add_shopping_cart,
                                size: iconSize,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
              Positioned(
                  bottom: kPriceLabelPositionBottom,
                  left: kPriceLabelPositionLeft,
                  child: Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    color: mainTextColor.withOpacity(labelBackgroundOpacity),
                    child: Text(
                        '${AppLocalizations.of(context)!.price} ${product.getStringPrice(context, product)} ',
                        style: labelButtonText),
                  )),
              product.isNew
                  ? Positioned(
                      top: kNewLabelPosition,
                      right: kNewLabelPosition,
                      child: Container(
                        padding:
                            const EdgeInsets.all(kDefaultSpaceBetweenWidgets),
                        color: pallet4.withOpacity(labelBackgroundOpacity),
                        child: Text(
                            AppLocalizations.of(context)!
                                .newDisplay
                                .toUpperCase(),
                            style: smallLabelText),
                      ))
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
