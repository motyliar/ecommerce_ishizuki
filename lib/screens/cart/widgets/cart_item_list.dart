import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/screens/error/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// dimensions of sized box which have inside price and remove button
const double kCartSizedBoxWidth = 80.0;
const double kCartSizedBoxHeight = 150.0;
// product image size in square shape
const double kCartProductImageSize = 120.0;
// opacity of remove button in cart item list
const double kCartRemoveButtonOpacity = 0.9;
const double kCartMainContainerPaddingLeft = 15.0;
const double kCartMainContainerPaddingRight = 20.0;
const double kCartMainContainerPaddingBottom = 5.0;
const double kCartMainContainerPaddingTop = 3.0;
const double kCartMainContainerRadiusElipticalX = 20.0;
const double kCartMainContainerRadiusElipticalY = 40.0;
const double kCartMainContainerBackgroundOpacity = 0.3;
const double kCartMainContainerGradientOpacity = 0.5;

class CartItemList extends StatelessWidget {
  final double productImageSquareSize;
  final double borderRadiusCircular;
  final double borderRadiusElipticalX;
  final double borderRadiusElipticalY;
  final double imageBoxOpacity;
  final double buttonBackgroundOpacity;
  final double backgroundGradientOpacity;
  final double mainContainerPaddingLeft;
  final double mainContainerPaddingRight;
  final double mainContainerPaddingBottom;
  final double mainContainerPaddingTop;
  final double sizedBoxWidth;
  final double sizedBoxHeight;
  const CartItemList({
    this.borderRadiusCircular = kRadiusAppDefault,
    this.borderRadiusElipticalX = kCartMainContainerRadiusElipticalX,
    this.borderRadiusElipticalY = kCartMainContainerRadiusElipticalY,
    this.imageBoxOpacity = kCartMainContainerBackgroundOpacity,
    this.backgroundGradientOpacity = kCartMainContainerGradientOpacity,
    this.mainContainerPaddingRight = kCartMainContainerPaddingRight,
    this.mainContainerPaddingLeft = kCartMainContainerPaddingLeft,
    this.mainContainerPaddingBottom = kCartMainContainerPaddingBottom,
    this.mainContainerPaddingTop = kCartMainContainerPaddingTop,
    this.buttonBackgroundOpacity = kCartRemoveButtonOpacity,
    this.productImageSquareSize = kCartProductImageSize,
    this.sizedBoxHeight = kCartSizedBoxHeight,
    this.sizedBoxWidth = kCartSizedBoxWidth,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Container(
              child: ListView.builder(
                  itemCount: state.cart.products.length,
                  itemBuilder: (context, index) {
                    return Builder(builder: (context) {
                      final price =
                          '${context.select((CurrencyBloc bloc) => bloc.state.currentConversion * state.cart.products[index].price)} ${context.select((CurrencyBloc bloc) => bloc.state.currentSign)}';
                      return Padding(
                        padding: EdgeInsets.only(
                            top: borderRadiusCircular,
                            left: borderRadiusCircular),
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: kDefaultSpaceBetweenWidgets),
                          padding: EdgeInsets.only(
                              right: mainContainerPaddingRight,
                              top: mainContainerPaddingTop,
                              left: mainContainerPaddingLeft,
                              bottom: mainContainerPaddingBottom),
                          decoration: BoxDecoration(
                              color: mainTextColor.withOpacity(imageBoxOpacity),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(borderRadiusCircular),
                                bottomRight: Radius.elliptical(
                                    borderRadiusElipticalX,
                                    borderRadiusElipticalY),
                              ),
                              gradient: LinearGradient(colors: [
                                mainTextColor
                                    .withOpacity(backgroundGradientOpacity),
                                backgroundColor,
                                mainTextColor
                                    .withOpacity(backgroundGradientOpacity)
                              ], begin: Alignment.topCenter),
                              boxShadow: [boxShadowLight]),
                          child: Row(
                            children: [
                              Image.network(
                                state.cart.products[index].imgUrl[0],
                                width: productImageSquareSize,
                                height: productImageSquareSize,
                              ),
                              SizedBox(
                                width: 80,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      state.cart.products[index].name,
                                      style: labelTextMidBlack,
                                    ),
                                    Text(price),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: kDefaultSpaceBetweenWidgets),
                                  padding:
                                      const EdgeInsets.all(kDefaultPadding),
                                  color: Colors.black
                                      .withOpacity(buttonBackgroundOpacity),
                                  child: InkWell(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          RemoveCartEvent(
                                              product:
                                                  state.cart.products[index]));
                                    },
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .removeButtonLabel,
                                      style: labelText,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }),
            );
          }
          return const ErrorScreen();
        },
      ),
    );
  }
}
