part of 'currency_bloc.dart';

sealed class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class ChangeCurrencyEvent extends CurrencyEvent {
  final String currency;
  const ChangeCurrencyEvent({this.currency = 'USD'});
  @override
  List<Object> get props => [currency];
}
