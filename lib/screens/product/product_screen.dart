import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'widgets_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

// button Add To Cart padding
const double kRightPaddingOfButtonAddToCart = 30.0;
const double kPriceLabelBackgroundOpacity = 0.6;

// screen class of single product view
class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({required this.product, super.key});

  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kProductScreen),
        builder: (_) => ProductScreen(product: product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          popArrow: false,
          imgName: product.categoryImg,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),

        // BODY
        body: SingleChildScrollView(
          child: Column(
            children: [
              GalleryWidget(product: product),
              Padding(
                padding: const EdgeInsets.only(
                    left: kDefaultSpaceBetweenWidgets, top: kDefaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                          color: backgroundColor
                              .withOpacity(kPriceLabelBackgroundOpacity)),
                      child: Text(
                        '${AppLocalizations.of(context)!.price} ${product.getStringPrice(context, product)} ',
                        style: labelText.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    product.isSold
                        ? Padding(
                            padding: const EdgeInsets.only(
                                right: kRightPaddingOfButtonAddToCart),
                            child: Container(
                              padding: const EdgeInsets.all(kDefaultPadding),
                              color: Colors.black,
                              child: Text(
                                AppLocalizations.of(context)!
                                    .sold
                                    .toUpperCase(),
                                style: labelText.copyWith(color: Colors.yellow),
                              ),
                            ),
                          )
                        : BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  context
                                      .read<CartBloc>()
                                      .add(AddCartEvent(product: product));
                                  Utils.snackBarMessage(context,
                                      '${AppLocalizations.of(context)!.addToCart}  ${product.name}');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: kRightPaddingOfButtonAddToCart),
                                  child: Container(
                                    padding:
                                        const EdgeInsets.all(kDefaultPadding),
                                    color: Colors.black,
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .addToCart
                                          .toUpperCase(),
                                      style: labelText,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(
                height: kDefaultSpaceBetweenWidgets,
              ),
              const Divider(
                thickness: kDividerThickness,
                color: backgroundColor,
                indent: kDividerDefaultIndent,
                endIndent: kDividerDefaultIndent,
              ),

              // DESCRIPTION PANEL
              ExpansionTile(
                textColor: Colors.black,
                iconColor: Colors.black,
                initiallyExpanded: true,
                title: Center(
                  child: Text(
                    AppLocalizations.of(context)!.description.toUpperCase(),
                    style: labelText.copyWith(color: Colors.black),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Column(children: [
                      DescriptionRow(
                          rightLabel:
                              '${AppLocalizations.of(context)!.description} :',
                          leftLabel: product.description),
                      DescriptionRow(
                          rightLabel:
                              '${AppLocalizations.of(context)!.height} :',
                          leftLabel:
                              '${product.dimensionHeight} ${AppLocalizations.of(context)!.scaleCM}'),
                      DescriptionRow(
                          rightLabel:
                              '${AppLocalizations.of(context)!.width} :',
                          leftLabel:
                              '${product.dimensionWidth} ${AppLocalizations.of(context)!.scaleCM}'),
                      DescriptionRow(
                        rightLabel: '${AppLocalizations.of(context)!.width} :',
                        leftLabel:
                            '${product.weight} ${AppLocalizations.of(context)!.scaleKG}',
                      )
                    ]),
                  ),
                ],
              ),
              Container(
                  padding:
                      const EdgeInsets.only(left: kDefaultSpaceBetweenWidgets),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .buttonQuestion
                            .toUpperCase(),
                        style: labelTextMidBlack,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, kContactScreen);
                          },
                          icon: const Icon(Icons.email)),
                    ],
                  )),
              Container(
                  padding:
                      const EdgeInsets.only(left: kDefaultSpaceBetweenWidgets),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        AppLocalizations.of(context)!
                            .buttonCustom
                            .toUpperCase(),
                        style: labelTextMidBlack,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, kCustomScreen);
                          },
                          icon: const Icon(Icons.messenger)),
                    ],
                  )),
            ],
          ),
        ));
  }
}
