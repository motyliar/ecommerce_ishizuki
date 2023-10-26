import 'package:flutter/material.dart';

import '../../../blocs/bloc_exports.dart';

// ignore: must_be_immutable
class ImageDialog extends StatelessWidget {
  final List<String> image;

  int indexo;
  ImageDialog({super.key, required this.image, required this.indexo});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SliderBloc()..add(SliderLoadingEvent(images: image, index: indexo)),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: InteractiveViewer(
          maxScale: 3,
          minScale: 0.3,
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
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(state.image[state.index]),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 160,
                        child: state.isStart
                            ? IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.yellow,
                                  size: 40,
                                ),
                                onPressed: () {
                                  context
                                      .read<SliderBloc>()
                                      .add(SliderDecrementEvent());
                                },
                              )
                            : Container()),
                    Positioned(
                        bottom: 0,
                        right: 90,
                        child: state.isEnd
                            ? IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_sharp,
                                  color: Colors.yellow,
                                  size: 40,
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
                  return const Text('wrong');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
