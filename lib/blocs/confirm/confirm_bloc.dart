import 'dart:async';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/repository/emailAPI/email_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/repository/exports.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  final OrderRepository _orderRepository;
  final ProductRepository _productRepository;
  final EmailRepository _emailRepository;
  ConfirmBloc(
      this._orderRepository, this._productRepository, this._emailRepository)
      : super(const ConfirmInitial()) {
    on<StartEvent>(
      (event, emit) async {
        emit(const ConfirmInitial());
        try {
          await Future<void>.delayed(
              const Duration(seconds: kDefaultDurationINSeconds));
          emit(ConfirmChanges(
              state.cart, state.address, state.status, state.orderSymbol));
        } catch (e) {
          Utils.printDebugError(errorMessage: e.toString());
        }
      },
    );
    on<GetCartEvent>(_getCart);
    on<TextFieldValuesEvent>(_getName);
    on<TextFieldStatusEvent>(_textFieldStatus);
    on<ClearAddressEvent>(_clearAddress);
    on<CountryValueEvent>(_getCountry);
    on<OrderConfirmSymbol>(_getSymbol);
    on<SendConfirmEmail>(_sendEmail);
    on<SendOrderToDB>(_sendOrderDB);
    on<SetSoldProduct>(_setSoldProduct);
  }

  _getCart(GetCartEvent event, Emitter<ConfirmState> emit) {
    emit(ConfirmChanges(
        event.cart, state.address, state.status, state.orderSymbol));
  }

  _textFieldStatus(TextFieldStatusEvent event, Emitter<ConfirmState> emit) {
    switch (event.fieldName) {
      case TextFieldEnum.name:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.name,
            state.orderSymbol));
      case TextFieldEnum.surname:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.surname,
            state.orderSymbol));
      case TextFieldEnum.email:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.email,
            state.orderSymbol));
      case TextFieldEnum.city:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.city,
            state.orderSymbol));
      case TextFieldEnum.street:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.street,
            state.orderSymbol));
      case TextFieldEnum.number:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.number,
            state.orderSymbol));
      case TextFieldEnum.zipcode:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.zipCode,
            state.orderSymbol));
      case TextFieldEnum.wishes:
        emit(ConfirmChanges(state.cart, state.address, TextFieldStatus.wishes,
            state.orderSymbol));
      default:
    }
  }

  _getName(TextFieldValuesEvent event, Emitter<ConfirmState> emit) {
    switch (state.status) {
      case TextFieldStatus.initial:
        emit(ConfirmChanges(
            state.cart, state.address, state.status, state.orderSymbol));
      case TextFieldStatus.name:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(name: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.surname:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(surname: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.city:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(city: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.street:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(street: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.email:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(email: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.number:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(numbers: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.zipCode:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(zipCode: event.value),
            state.status,
            state.orderSymbol));
      case TextFieldStatus.wishes:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(wishes: event.value),
            state.status,
            state.orderSymbol));
      default:
    }
  }

  _clearAddress(ClearAddressEvent event, Emitter<ConfirmState> emit) {
    emit(ConfirmChanges(
        state.cart, const Address(), state.status, state.orderSymbol));
  }

  _getCountry(CountryValueEvent event, Emitter<ConfirmState> emit) {
    emit(ConfirmChanges(
        state.cart,
        state.address.copyWith(country: event.value),
        state.status,
        state.orderSymbol));
  }

  _getSymbol(OrderConfirmSymbol event, Emitter<ConfirmState> emit) {
    emit(ConfirmChanges(
        state.cart, state.address, state.status, Utils().creatingSymbol()));
  }

  _sendEmail(
    SendConfirmEmail event,
    Emitter<ConfirmState> emit,
  ) async {
    _emailRepository.sendConfirmEmailToUser(
        userName: state.address.name,
        userEmail: state.address.email,
        orderSymbol: state.orderSymbol);
  }

  _sendOrderDB(SendOrderToDB event, Emitter<ConfirmState> emit) async {
    try {
      await _orderRepository.postOrder(
          state.orderSymbol, state.address, state.cart, state.cart.products);
    } catch (err) {
      Utils.printDebugError(errorMessage: err.toString());
    }
  }

  _setSoldProduct(SetSoldProduct event, Emitter<ConfirmState> emit) async {
    List<String> productsId = state.cart.products.map((e) => e.id).toList();

    try {
      await _productRepository.updateSoldProduct(productsId);
    } catch (err) {
      Utils.printDebugError(errorMessage: err.toString());
    }
  }
}
