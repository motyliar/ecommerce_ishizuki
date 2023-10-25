part of 'cart_bloc.dart';

class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

// ignore: must_be_immutable
class CartLoaded extends CartState {
  final Cart cart;
  String droppedValue;
  bool isVisible;
  bool deliveryAgree;

  CartLoaded(
      {this.cart = const Cart(),
      this.droppedValue = '',
      this.isVisible = false,
      this.deliveryAgree = false});

  CartLoaded copyWith(
      {Cart? cart,
      String? droppedValue,
      bool? isVisible,
      bool? deliveryAgree}) {
    return CartLoaded(
        cart: cart ?? this.cart,
        droppedValue: droppedValue ?? this.droppedValue,
        isVisible: isVisible ?? this.isVisible,
        deliveryAgree: deliveryAgree ?? this.deliveryAgree);
  }

  @override
  List<Object> get props => [cart, droppedValue, isVisible, deliveryAgree];
}

class CartError extends CartState {}
