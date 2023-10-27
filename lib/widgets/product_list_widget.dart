import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class ProductListWidget extends StatelessWidget {
  final double size;
  final double iconSize;

  final bool isSold;
  final Product product;
  const ProductListWidget({
    this.iconSize = 30,
    this.size = 200,
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
            Navigator.pushNamed(context, '/productScreen', arguments: product);
            context
                .read<GaleryBloc>()
                .add(GaleryLoadingEvent(image: product.imgUrl, index: 0));
          },
          child: Stack(
            children: [
              const SizedBox(
                width: 250,
                height: 220,
              ),
              Positioned(
                left: 30,
                top: 25,
                child: Image.network(
                  product.imgUrl[0],
                  width: size,
                  height: size,
                ),
              ),
              product.isSold
                  ? Positioned(
                      top: 28,
                      left: 40,
                      child: Container(
                        width: size - 22,
                        height: size - 22,
                        color: Colors.black.withOpacity(0.4),
                        child: Center(
                            child: Container(
                          color: labelColor,
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'SOLD',
                            style: labelText,
                          ),
                        )),
                      ))
                  : Container(),
              Positioned(
                top: 5,
                left: 10,
                child: Container(
                  color: backgroundColor.withOpacity(0.7),
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    product.name,
                    style: labelText.copyWith(fontSize: 14),
                  ),
                ),
              ),
              product.isSold
                  ? Container()
                  : BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        return Positioned(
                          top: 75,
                          right: 15,
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<CartBloc>()
                                  .add(AddCartEvent(product: product));
                              final snackBar = SnackBar(
                                content: Text('Add to Cart ${product.name}'),
                                duration: Duration(seconds: 1),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              height: iconSize + 10,
                              width: iconSize + 10,
                              color: backgroundColor.withOpacity(0.7),
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
                  bottom: 20,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: mainTextColor.withOpacity(0.8),
                    child: Text(
                        'Price: ${product.getStringPrice(context, product)} ',
                        style: labelText.copyWith(
                            color: Colors.white, fontSize: 18)),
                  )),
              product.isNew
                  ? Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.all(9),
                        color: pallet4.withOpacity(0.7),
                        child: Text(
                          'NEW',
                          style: labelText.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ))
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
