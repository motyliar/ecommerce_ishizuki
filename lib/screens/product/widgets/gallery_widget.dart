import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/screens/product/widgets_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GaleryBloc, GaleryState>(
      builder: (context, state) {
        if (state is GaleryInitial) {
          context.read<GaleryBloc>().add(GaleryUpdate(
                image: product.imgUrl,
              ));
          print(state);

          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GaleryLoaded) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 240,
                    width: 70,
                    child: ListView.builder(
                        controller: ScrollController(
                            initialScrollOffset: 100, keepScrollOffset: true),
                        itemCount: product.imgUrl.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<GaleryBloc>().add(GaleryLoadingEvent(
                                  image: product.imgUrl, index: index));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.network(
                                product.imgUrl[index],
                                width: 60,
                                height: 60,
                              ),
                            ),
                          );
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Stack(children: [
                      const SizedBox(
                        width: 260,
                        height: 260,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ImageDialog(
                                  image: state.image, indexo: state.index));
                        },
                        child: Container(
                          width: 240,
                          height: 240,
                          child: Image.network(state.image[state.index]),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: backgroundColor.withOpacity(0.6)),
                            child: Text(
                              product.name,
                              style: labelText.copyWith(fontSize: 35),
                            ),
                          ))
                    ]),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const Text('Something Wrong');
        }
      },
    );
  }
}
