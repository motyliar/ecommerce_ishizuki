import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/screens/product/widgets_exports.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';

const double kVerticalListOfImageHeight = 240.0;
const double kVerticalListOfImageWidth = 70.0;
// initial value for view of vertical gallery
const double kInitialViewOffsetOfVerticalGallery = 100.0;
// vertical gallery padding
const double kVerticalGalleryPadding = 2.0;
// vertical gallery image size shape square
const double kVerticalGalleryImageSizeSquare = 60.0;
// single view of image stack
const double kStackOfSingleImageDimension = 260.0;
const double kSingleImageSizeSquare = 240.0;
const double kStackPaddingHorizontal = 20.0;
const double kStackPaddingVertical = 10.0;

// product name label values
// opacity background under image from product name label
const double kProductNameLabelBackgroundOpacity = 0.6;
// stack position of label in single gallery stack
const double kProductNameLabelPositionLeft = 8.0;

class GalleryWidget extends StatelessWidget {
  final double verticalGalleryPadding;
  final double verticalGalleryImageSizeSqaure;
  final double verticalListOfImageHeight;
  final double verticalListOfImageWidth;
  final double initialViewOffsetOfVerticalGallery;
  final double stackOFSingleImageDimension;
  final double singleImageSizeSquare;
  final double stackPaddingHorizontal;
  final double stackPaddingVertical;
  final double productNameLabelBackgroundOpacity;
  final double productNameLabelPositionLeft;
  const GalleryWidget({
    this.verticalGalleryPadding = kVerticalGalleryPadding,
    this.verticalGalleryImageSizeSqaure = kVerticalGalleryImageSizeSquare,
    this.verticalListOfImageHeight = kVerticalListOfImageHeight,
    this.verticalListOfImageWidth = kVerticalListOfImageWidth,
    this.initialViewOffsetOfVerticalGallery =
        kInitialViewOffsetOfVerticalGallery,
    this.stackOFSingleImageDimension = kStackOfSingleImageDimension,
    this.singleImageSizeSquare = kSingleImageSizeSquare,
    this.stackPaddingHorizontal = kStackPaddingHorizontal,
    this.stackPaddingVertical = kStackPaddingVertical,
    this.productNameLabelBackgroundOpacity = kProductNameLabelBackgroundOpacity,
    this.productNameLabelPositionLeft = kProductNameLabelPositionLeft,
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
                    height: verticalListOfImageHeight,
                    width: verticalListOfImageWidth,
                    /*                   
                     Start of vertical gallery, start from top left sides of Product Screen                                      
                    */
                    child: ListView.builder(
                        controller: ScrollController(
                            initialScrollOffset:
                                initialViewOffsetOfVerticalGallery,
                            keepScrollOffset: true),
                        itemCount: product.imgUrl.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              context.read<GaleryBloc>().add(GaleryLoadingEvent(
                                  image: product.imgUrl, index: index));
                            },
                            child: Padding(
                              padding: EdgeInsets.all(verticalGalleryPadding),
                              child: Image.network(
                                product.imgUrl[index],
                                width: kVerticalGalleryImageSizeSquare,
                                height: kVerticalGalleryImageSizeSquare,
                              ),
                            ),
                          );
                        })),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: stackPaddingHorizontal,
                        vertical: stackPaddingVertical),
                    /*
                      Start Stack of single image
                      */
                    child: Stack(children: [
                      SizedBox(
                        width: stackOFSingleImageDimension,
                        height: stackOFSingleImageDimension,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ImageDialog(
                                  image: state.image, indexo: state.index));
                        },
                        child: Container(
                          width: singleImageSizeSquare,
                          height: singleImageSizeSquare,
                          child: Image.network(state.image[state.index]),
                        ),
                      ),
                      Positioned(
                          bottom: kStackPositionDefault,
                          left: productNameLabelPositionLeft,
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            decoration: BoxDecoration(
                                color: backgroundColor.withOpacity(
                                    productNameLabelBackgroundOpacity)),
                            child: Text(
                              product.name,
                              style: bigLabelText,
                            ),
                          ))
                    ]),
                  ),
                ],
              ),
            ],
          );
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
