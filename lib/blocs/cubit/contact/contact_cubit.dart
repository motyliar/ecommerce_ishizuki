import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';

import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(const ContactInitial());

  changeStatus(TextFieldEnum name) {
    switch (name) {
      case TextFieldEnum.name:
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.name));
      case TextFieldEnum.email:
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.email));
      case TextFieldEnum.subject:
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.subject));
      case TextFieldEnum.description:
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.content));
      default:
    }
  }

  textFieldStates(String value) {
    switch (state.status) {
      case TextFieldStatus.name:
        return emit(state.copyWith(
            contact: state.contact.copyWith(name: value),
            status: state.status));
      case TextFieldStatus.email:
        return emit(state.copyWith(
            contact: state.contact.copyWith(userEmail: value),
            status: state.status));
      case TextFieldStatus.subject:
        return emit(state.copyWith(
            contact: state.contact.copyWith(subject: value),
            status: state.status));
      case TextFieldStatus.content:
        return emit(state.copyWith(
            contact: state.contact.copyWith(content: value),
            status: state.status));
      default:
    }
  }

  sendEmail() async {
    if (state.contact.content == '' ||
        state.contact.userEmail == '' ||
        state.contact.name == '' ||
        state.contact.subject == '') {
      debugPrint('Empty values');
    } else {
      const serviceId = 'service_loy3rqq';
      const templateId = 'template_o2jg9yo';
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
              'user_name': state.contact.name,
              'user_subject': state.contact.subject,
              'user_userEmail': state.contact.userEmail,
              'user_content': state.contact.content
            }
          }));
      if (response.body == 'OK') {
        emit(ContactInitial());
        emit(state.copyWith(status: TextFieldStatus.comeback));
      } else {
        debugPrint('Not sended');
      }
    }
    print(state);
  }
}
