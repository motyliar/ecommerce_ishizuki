import 'dart:async';
import 'dart:convert';

import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  ConfirmBloc() : super(const ConfirmInitial()) {
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
  }

  _getCart(GetCartEvent event, Emitter<ConfirmState> emit) {
    emit(ConfirmChanges(
        event.cart, state.address, state.status, state.orderSymbol));
  }

  _textFieldStatus(TextFieldStatusEvent event, Emitter<ConfirmState> emit) {
    switch (event.fieldName) {
      case 'NAME':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.name, state.orderSymbol));
      case 'SURNAME':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.surname, state.orderSymbol));
      case 'EMAIL':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.email, state.orderSymbol));
      case 'CITY':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.city, state.orderSymbol));
      case 'STREET':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.street, state.orderSymbol));
      case 'NUMBER':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.number, state.orderSymbol));
      case 'ZIPCODE':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.zipCode, state.orderSymbol));
      case 'WISHES':
        emit(ConfirmChanges(
            state.cart, state.address, TextStatus.wishes, state.orderSymbol));
    }
  }

  _getName(TextFieldValuesEvent event, Emitter<ConfirmState> emit) {
    switch (state.status.index) {
      case 0:
        emit(ConfirmChanges(
            state.cart, state.address, state.status, state.orderSymbol));
      case 1:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(name: event.value),
            state.status,
            state.orderSymbol));
      case 2:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(surname: event.value),
            state.status,
            state.orderSymbol));
      case 3:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(city: event.value),
            state.status,
            state.orderSymbol));
      case 4:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(street: event.value),
            state.status,
            state.orderSymbol));
      case 5:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(email: event.value),
            state.status,
            state.orderSymbol));
      case 6:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(numbers: event.value),
            state.status,
            state.orderSymbol));
      case 7:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(zipCode: event.value),
            state.status,
            state.orderSymbol));
      case 8:
        emit(ConfirmChanges(
            state.cart,
            state.address.copyWith(wishes: event.value),
            state.status,
            state.orderSymbol));
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
    print(response.body);
    print('message_sent');
    print(state);
  }
}
