part of 'currency_bloc.dart';

sealed class CurrencyState extends Equatable {
  final String currentCurrency;
  final String currentSign;
  final double currentConversion;

  const CurrencyState(
      this.currentCurrency, this.currentConversion, this.currentSign);

  @override
  List<Object> get props => [currentCurrency, currentConversion, currentSign];
}

final class CurrencyInitial extends CurrencyState {
  const CurrencyInitial() : super('EUR', kCurrencyToCalculatePriceEuro, '€');
}

class ChangeCurrency extends CurrencyState {
  const ChangeCurrency(
      String currentCurrency, String currentSign, double currentConversion)
      : super(currentCurrency, currentConversion, currentSign);

  @override
  List<Object> get props => [currentCurrency, currentSign, currentConversion];
}
