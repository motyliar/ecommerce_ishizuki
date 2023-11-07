part of 'confirm_bloc.dart';

sealed class ConfirmEvent extends Equatable {
  const ConfirmEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends ConfirmEvent {}

class GetCartEvent extends ConfirmEvent {
  final Cart cart;
  const GetCartEvent({required this.cart});
  @override
  List<Object> get props => [cart];
}

class TextFieldStatusEvent extends ConfirmEvent {
  final TextFieldEnum fieldName;
  const TextFieldStatusEvent({required this.fieldName});
  @override
  List<Object> get props => [fieldName];
}

class GetFullOrderEvent extends ConfirmEvent {}

class TextFieldValuesEvent extends ConfirmEvent {
  final String value;
  const TextFieldValuesEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class ClearAddressEvent extends ConfirmEvent {}

class CountryValueEvent extends ConfirmEvent {
  final String value;
  const CountryValueEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class OrderConfirmSymbol extends ConfirmEvent {}

class SendConfirmEmail extends ConfirmEvent {}

class SendOrderToDB extends ConfirmEvent {}

class SetSoldProduct extends ConfirmEvent {}
