import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

const double kCurrencyToCalculatePriceEuro = 1.0;
const double kCurrencyToCalculatePriceUSD = 1.05;
const double kCurrencyToCalculatePriceGBP = 0.87;

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<ChangeCurrencyEvent>(_onChange);
  }

  _onChange(ChangeCurrencyEvent event, Emitter<CurrencyState> emit) {
    if (state.currentCurrency == 'EUR') {
      emit(const ChangeCurrency(
        'USD',
        '\$',
        kCurrencyToCalculatePriceUSD,
      ));
    } else if (state.currentCurrency == 'USD') {
      emit(const ChangeCurrency('GBP', '£', kCurrencyToCalculatePriceGBP));
    } else {
      emit(const ChangeCurrency('EUR', '€', kCurrencyToCalculatePriceEuro));
    }
  }
}
