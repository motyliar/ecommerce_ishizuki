import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:equatable/equatable.dart';
part 'slider_event.dart';
part 'slider_state.dart';

const int kDecrementGaleryIndex = 1;
const int kTwoPositionOfStateGallery = 2;
const int kOnePositionOfStateGallery = 1;

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderState()) {
    on<SliderIncrementEvent>((event, emit) {
      final state = this.state as SliderLoadedState;
      if (state.index < state.image.length - kDecrementGaleryIndex) {
        emit(state.copyWith(
            index: state.index + kOnePositionOfStateGallery,
            isEnd: state.isEnd = true,
            isStart: state.isStart = true));
      }
      if (state.index == state.image.length - kTwoPositionOfStateGallery) {
        emit(state.copyWith(
            index: state.index + kOnePositionOfStateGallery,
            isEnd: state.isEnd = false));
      }
    });
    on<SliderDecrementEvent>((event, emit) {
      final state = this.state as SliderLoadedState;
      if (state.index > 0) {
        emit(state.copyWith(
            index: state.index - kDecrementGaleryIndex,
            isStart: state.isStart = true,
            isEnd: state.isEnd = true));
      }
      if (state.index == 1) {
        emit(state.copyWith(
            isStart: state.isStart = false,
            index: state.index - kDecrementGaleryIndex));
      }
    });

    on<SliderInitialEvent>((event, emit) async {
      emit(SliderInitial());
      try {
        await Future<void>.delayed(
            const Duration(seconds: kDefaultDurationINSeconds));
        emit(SliderLoadedState());
      } catch (e) {
        print(e);
      }
    });
    on<SliderLoadingEvent>((event, emit) {
      emit(SliderLoadedState());
      final state = this.state as SliderLoadedState;
      emit(SliderLoadedState(image: event.images, index: event.index));
    });
  }
}
