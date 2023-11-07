import 'dart:async';
import 'dart:convert';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/repository/exports.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  OrderRepository _orderRepository;
  ProductRepository _productRepository;
  ConfirmBloc(this._orderRepository, this._productRepository)
      : super(const ConfirmInitial()) {
    on<StartEvent>(
      (event, emit) async {
        emit(const ConfirmInitial());
        try {
          await Future<void>.delayed(const Duration(seconds: 1));
          emit(ConfirmChanges(
              state.cart, state.address, state.status, state.orderSymbol));
        } catch (e) {}
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
    String creatingSymbol() {
      final DateTime data = DateTime.now();
      final dataFormat = data.month.toString();
      String characters = 'ABCDEFGHIJKLMNOPRSTUWXYZ123456789';
      List randomSymbol = [];
      Random random = Random();
      for (int i = 0; i < 6; i++) {
        randomSymbol.add(characters[random.nextInt(characters.length)]);
      }
      return '2023 -${randomSymbol.join()}-${dataFormat}';
    }

    emit(ConfirmChanges(
        state.cart, state.address, state.status, creatingSymbol()));
  }

  _sendEmail(
    SendConfirmEmail event,
    Emitter<ConfirmState> emit,
  ) async {
    const serviceId = 'service_loy3rqq';
    const templateId = 'template_cwp9sg7';
    const userId = 'cdT7F_odFHGuBXuh3';
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': state.address.name,
            'user_email': state.address.email,
            'user_order': state.orderSymbol
          }
        }));
    if (response.body == 'OK') {}
  }

  _sendOrderDB(SendOrderToDB event, Emitter<ConfirmState> emit) async {
    try {
      await _orderRepository.postOrder(
          state.orderSymbol, state.address, state.cart, state.cart.products);
    } catch (err) {
      print(err);
    }
  }

  _setSoldProduct(SetSoldProduct event, Emitter<ConfirmState> emit) async {
    List<String> productsId = state.cart.products.map((e) => e.id).toList();

    try {
      await _productRepository.updateSoldProduct(productsId);
    } catch (err) {
      debugPrint('$err');
    }
  }
}
