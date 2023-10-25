import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'galery_event.dart';
part 'galery_state.dart';

class GaleryBloc extends Bloc<GaleryEvent, GaleryState> {
  GaleryBloc() : super(GaleryInitial()) {
    on<GaleryUpdate>(_onGaleryUpdate);
    on<GaleryLoadingEvent>(_onGaleryLoading);
    on<IncrementGaleryIndex>(_onIncrementGalery);
    on<DecrementGaleryIndex>(_onDecrementGalery);
  }
  void _onGaleryUpdate(GaleryUpdate event, Emitter<GaleryState> emit) {
    emit(GaleryLoaded(image: event.image, maxIndex: event.maxIndex));
  }

  void _onGaleryLoading(GaleryLoadingEvent event, Emitter<GaleryState> emit) {
    emit(GaleryLoaded(image: event.image, index: event.index));
  }

  void _onIncrementGalery(
      IncrementGaleryIndex event, Emitter<GaleryState> emit) {
    final state = this.state as GaleryLoaded;
    if (state.index < state.maxIndex) {
      emit(GaleryLoaded(index: state.index + 1));
      print(state.index);
    }

    print('${state.maxIndex} this is max state');
  }

  void _onDecrementGalery(
      DecrementGaleryIndex event, Emitter<GaleryState> emit) {
    final state = this.state as GaleryLoaded;
    if (state.index > 0) {
      emit(GaleryLoaded(index: state.index - 1));
      emit(GaleryLoaded(isStart: true));
    }
    print(state.index);
  }
}


// on<GaleryLoadingEvent>((event, emit) {
    //   final state = this.state as GaleryLoaded;
    //   emit(state.copyWith(image: event.image));
    //   print('${state.image}');
    // });
