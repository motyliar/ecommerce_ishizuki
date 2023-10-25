import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc() : super(CurrencyInitial()) {
    on<ChangeCurrencyEvent>(_onChange);
  }

  _onChange(ChangeCurrencyEvent event, Emitter<CurrencyState> emit) {
    if (state.currentCurrency == 'EUR') {
      emit(ChangeCurrency(
        'USD',
        '\$',
        1.05,
      ));
    } else if (state.currentCurrency == 'USD') {
      emit(ChangeCurrency('GBP', '£', 0.87));
    } else {
      emit(ChangeCurrency('EUR', '€', 1));
    }
  }
}
