import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delivery_state.dart';

const int kListIndexOfUKPrices = 1;
const int kListIndexOfUSAPrices = 2;
const int kListIndexOfOTHERPrices = 3;
const int kListIndexOfEUROPrices = 0;

class DeliveryCubit extends Cubit<DeliveryState> {
  DeliveryCubit() : super(const DeliveryInitial());

  changeCountry(String value) {
    if (value == 'UK') {
      emit(state.copyWith(
          pricesValue: value, pricesIndex: kListIndexOfUKPrices));
    } else if (value == 'USA') {
      emit(state.copyWith(
          pricesValue: value, pricesIndex: kListIndexOfUSAPrices));
    } else if (value == 'Other') {
      emit(state.copyWith(
          pricesValue: value, pricesIndex: kListIndexOfOTHERPrices));
    } else {
      emit(state.copyWith(
          pricesValue: value, pricesIndex: kListIndexOfEUROPrices));
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
