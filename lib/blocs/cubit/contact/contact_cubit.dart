import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(const ContactInitial());

  changeStatus(String textFieldName) {
    switch (textFieldName) {
      case 'NAME':
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.name));
      case 'EMAIL':
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.email));
      case 'SUBJECT':
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.subject));
      case 'CONTENT':
        return emit(state.copyWith(
            contact: state.contact, status: TextFieldStatus.content));
    }
  }

  textFieldStates(String value) {
    switch (state.status.index) {
      case 1:
        return emit(state.copyWith(
            contact: state.contact.copyWith(name: value),
            status: state.status));
      case 2:
        return emit(state.copyWith(
            contact: state.contact.copyWith(userEmail: value),
            status: state.status));
      case 3:
        return emit(state.copyWith(
            contact: state.contact.copyWith(subject: value),
            status: state.status));
      case 4:
        return emit(state.copyWith(
            contact: state.contact.copyWith(content: value),
            status: state.status));
    }
  }

  sendEmail() async {
    if (state.contact.content == '' ||
        state.contact.userEmail == '' ||
        state.contact.name == '' ||
        state.contact.subject == '') {
      print('Empty values');
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
        contactEmailController.clear();
        contactNameController.clear();
        contactQuestionController.clear();
        contactSubjectController.clear();
        emit(ContactInitial());
        emit(state.copyWith(status: TextFieldStatus.comeback));
      } else {
        print('Not sended');
      }
    }
    print(state);
  }
}
