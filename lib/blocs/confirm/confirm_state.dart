part of 'confirm_bloc.dart';

enum TextStatus {
  initial,
  name,
  surname,
  city,
  street,
  email,
  number,
  zipCode,
  wishes
}

class ConfirmState extends Equatable {
  final Cart cart;
  final Address address;
  final TextFieldStatus status;
  final String orderSymbol;

  const ConfirmState(this.cart, this.address, this.status, this.orderSymbol);

  ConfirmState copyWith(
      {Cart? cart,
      Address? address,
      TextFieldStatus? status,
      String? orderSymbol}) {
    return ConfirmState(cart ?? this.cart, address ?? this.address.copyWith(),
        status ?? this.status, orderSymbol ?? this.orderSymbol);
  }

  @override
  List<Object> get props => [cart, address, status, orderSymbol];
}

final class ConfirmInitial extends ConfirmState {
  const ConfirmInitial()
      : super(const Cart(), const Address(), TextFieldStatus.initial, '');
}

class ConfirmChanges extends ConfirmState {
  const ConfirmChanges(
      Cart cart, Address address, TextFieldStatus status, String orderSymbol)
      : super(cart, address, status, orderSymbol);

  ConfirmChanges copyWith(
      {Cart? cart,
      Address? address,
      TextFieldStatus? status,
      String? orderSymbol}) {
    return ConfirmChanges(cart ?? this.cart, address ?? this.address.copyWith(),
        status ?? this.status, orderSymbol ?? this.orderSymbol);
  }

  @override
  List<Object> get props => [cart, address, status, orderSymbol];
}
