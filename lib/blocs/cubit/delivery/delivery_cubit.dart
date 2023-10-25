import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(const DeliveryInitial());

  changeCountry(String value) {
    if (value == 'UK') {
      emit(state.copyWith(pricesValue: value, pricesIndex: 1));
    } else if (value == 'USA') {
      emit(state.copyWith(pricesValue: value, pricesIndex: 2));
    } else if (value == 'Other') {
      emit(state.copyWith(pricesValue: value, pricesIndex: 3));
    } else {
      emit(state.copyWith(pricesValue: value, pricesIndex: 0));
    }
  }

  changeWeight() {
    if (state.weight) {
      emit(state.copyWith(weight: false));
    } else {
      emit(state.copyWith(weight: true));
    }
  }
}
