import 'package:bloc/bloc.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<StartCartEvent>((event, emit) {
      emit(CartInitial());
      try {
        Future<void>.delayed(const Duration(seconds: 1));
        emit(CartLoaded());
      } catch (e) {
        rethrow;
      }
    });
    on<AddCartEvent>((event, emit) {
      final state = this.state as CartLoaded;
      if (state.cart.products.isEmpty) {
        emit(CartLoaded(
            isVisible: state.isVisible,
            deliveryAgree: state.deliveryAgree,
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product))));
      }
      if (state.cart.products.isNotEmpty) {
        List names = [];
        for (int i = 0; i < state.cart.products.length; i++) {
          names.add(state.cart.products[i].name);
        }

        if (!names.contains(event.product.name)) {
          emit(CartLoaded(
              deliveryAgree: state.deliveryAgree,
              isVisible: state.isVisible,
              cart: Cart(
                  products: List.from(state.cart.products)
                    ..insert(0, event.product))));
        } else {
          print('in list');
        }
      }
    });

    on<RemoveCartEvent>((event, emit) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(
          isVisible: true,
          deliveryAgree: state.deliveryAgree,
          cart: Cart(
              products: List.from(state.cart.products)..remove(event.product),
              value: state.cart.value)));
    });
    on<DeliveryValueEvent>((event, emit) {
      final state = this.state as CartLoaded;

      if (event.value != '') {
        emit(state.copyWith(
            isVisible: true,
            deliveryAgree: state.deliveryAgree,
            cart: Cart(value: event.value, products: state.cart.products)));
      }
    });

    on<GetCurrencyEvent>((event, emit) {
      final state = this.state as CartLoaded;

      emit(state.copyWith(
          isVisible: true,
          deliveryAgree: state.deliveryAgree,
          cart: Cart(
              value: state.cart.value,
              products: state.cart.products,
              currencyCalculate: event.currencyCalculate)));
    });

    on<DeliveryAgreeEvent>((event, emit) {
      final state = this.state as CartLoaded;
      emit(CartLoaded(
          deliveryAgree: true, isVisible: state.isVisible, cart: state.cart));
      print(state);
    });
  }
}
