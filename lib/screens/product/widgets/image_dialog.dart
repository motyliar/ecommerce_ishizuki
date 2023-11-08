import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_exports.dart';

// scale for zoom view in gallery
const double kMaxZoomView = 3.0;
const double kMinZoomView = 0.3;
// sizes of widget zoom view of single gallery
const double kInitialSizeOfZoomGallery = 300.0;
// yellow icon sizes
const double kIconSize = 40.0;
const double kIconPositionLeft = 160.0;
const double kIconPositionRight = 90.0;

class ImageDialog extends StatelessWidget {
  final List<String> image;
  final double initialSizeOfZoomGallery;
  final double iconSize;
  final double iconPositionLeft;
  final double iconPositionRight;
  final int indexo;
  const ImageDialog(
      {super.key,
      required this.image,
      required this.indexo,
      this.initialSizeOfZoomGallery = kInitialSizeOfZoomGallery,
      this.iconSize = kIconSize,
      this.iconPositionLeft = kIconPositionLeft,
      this.iconPositionRight = kIconPositionRight});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SliderBloc()..add(SliderLoadingEvent(images: image, index: indexo)),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: InteractiveViewer(
          maxScale: kMaxZoomView,
          minScale: kMinZoomView,
          child: Dialog(
            child: BlocBuilder<SliderBloc, SliderState>(
              builder: (context, state) {
                if (state is SliderInitial) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SliderLoadedState) {
                  return Stack(children: [
                    Container(
                      width: initialSizeOfZoomGallery,
                      height: initialSizeOfZoomGallery,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(state.image[state.index]),
                              fit: BoxFit.scaleDown)),
                    ),
                    Positioned(
                        bottom: kStackPositionDefault,
                        right: iconPositionLeft,
                        child: state.isStart
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.yellow,
                                  size: iconSize,
                                ),
                                onPressed: () {
                                  context
                                      .read<SliderBloc>()
                                      .add(SliderDecrementEvent());
                                },
                              )
                            : Container()),
                    Positioned(
                        bottom: kStackPositionDefault,
                        right: iconPositionRight,
                        child: state.isEnd
                            ? IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.yellow,
                                  size: iconSize,
                                ),
                                onPressed: () {
                                  context
                                      .read<SliderBloc>()
                                      .add(SliderIncrementEvent());
                                },
                              )
                            : Container()),
                  ]);
                } else {
                  return const ErrorScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
