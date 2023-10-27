import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

import 'widgets_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

// screen class of single product view
class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({required this.product, super.key});

  static const routeName = '/productScreen';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
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
                padding: const EdgeInsets.only(left: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: backgroundColor.withOpacity(0.6)),
                      child: Text(
                        'Price: ${product.getStringPrice(context, product)} ',
                        style: labelText.copyWith(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    product.isSold
                        ? Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.black,
                              child: Text(
                                'SOLD',
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
                                  final snackBar = SnackBar(
                                    content:
                                        Text('Add to Cart ${product.name}'),
                                    duration: Duration(seconds: 1),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    color: Colors.black,
                                    child: const Text(
                                      'ADD TO CART',
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
                height: 7,
              ),
              const Divider(
                thickness: 1,
                color: backgroundColor,
                indent: 20,
                endIndent: 40,
              ),

              // DESCRIPTION PANEL
              ExpansionTile(
                textColor: Colors.black,
                iconColor: Colors.black,
                initiallyExpanded: true,
                title: Center(
                  child: Text(
                    'DESCRIPTION',
                    style: labelText.copyWith(color: Colors.black),
                  ),
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      DescriptionRow(
                          rightLabel: 'Description: ',
                          leftLabel: product.description),
                      DescriptionRow(
                          rightLabel: 'Height: ',
                          leftLabel: '${product.dimensionHeight} cm'),
                      DescriptionRow(
                          rightLabel: 'Width: ',
                          leftLabel: '${product.dimensionWidth} cm'),
                      DescriptionRow(
                        rightLabel: 'Weight: ',
                        leftLabel: '${product.weight} kg',
                      )
                    ]),
                  ),
                ],
              ),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'ARE YOU HAVE ANY QUESTION?',
                        style: labelTextMidBlack,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/contactScreen');
                          },
                          icon: const Icon(Icons.email)),
                    ],
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      const Text(
                        'WOULD YOU LIKE ORDER OTHER?',
                        style: labelTextMidBlack,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/customOrderScreen');
                          },
                          icon: const Icon(Icons.messenger)),
                    ],
                  )),
            ],
          ),
        ));
  }
}
