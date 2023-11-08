import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'galery_event.dart';
part 'galery_state.dart';

const int kIncrementOnePositionOfStateIndex = 1;
const int kDecrementOnePOsitionOfStateIndex = 1;

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
      emit(
          GaleryLoaded(index: state.index + kIncrementOnePositionOfStateIndex));
    }
  }

  void _onDecrementGalery(
      DecrementGaleryIndex event, Emitter<GaleryState> emit) {
    final state = this.state as GaleryLoaded;
    if (state.index > 0) {
      emit(
          GaleryLoaded(index: state.index - kDecrementOnePOsitionOfStateIndex));
      emit(GaleryLoaded(isStart: true));
    }
  }
}
