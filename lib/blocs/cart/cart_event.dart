part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class StartCartEvent extends CartEvent {}

class UpdateCartEvent extends CartEvent {}

class AddCartEvent extends CartEvent {
  final Product product;
  const AddCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class RemoveCartEvent extends CartEvent {
  final Product product;
  const RemoveCartEvent({required this.product});
  @override
  List<Object> get props => [product];
}

class DeliveryValueEvent extends CartEvent {
  final String value;
  DeliveryValueEvent({this.value = ''});
  @override
  List<Object> get props => [value];
}

class GetCurrencyEvent extends CartEvent {
  final double currencyCalculate;
  GetCurrencyEvent({required this.currencyCalculate});
  @override
  List<Object> get props => [currencyCalculate];
}

class DeliveryAgreeEvent extends CartEvent {}
