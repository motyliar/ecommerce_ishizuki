import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class ProductListHome extends StatelessWidget {
  final Product product;
  const ProductListHome({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GaleryBloc, GaleryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/productScreen',
                  arguments: product);
              context
                  .read<GaleryBloc>()
                  .add(GaleryLoadingEvent(image: product.imgUrl, index: 0));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration:
                  shadeBox.copyWith(color: mainTextColor.withOpacity(0.01)),
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
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            child: Image.network(
                              product.imgUrl[0],
                              width: 150,
                              height: 150,
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
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(9),
                                      color: pallet4.withOpacity(0.7),
                                      child: Text(
                                        'NEW',
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
                                    final snackBar = SnackBar(
                                      content:
                                          Text('Add to Cart ${product.name}'),
                                      duration: Duration(seconds: 1),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    height: 45,
                                    width: 45,
                                    color: backgroundColor.withOpacity(0.7),
                                    child: Icon(
                                      Icons.add_shopping_cart,
                                      size: 35,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 38.0,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          color: mainTextColor.withOpacity(0.8),
                          child: Text(
                              'Price: ${product.getStringPrice(context, product)} ',
                              style: labelText.copyWith(
                                  color: Colors.white, fontSize: 23)),
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
