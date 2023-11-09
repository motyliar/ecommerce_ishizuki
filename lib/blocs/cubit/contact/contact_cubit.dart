import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/repository/emailAPI/email_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  final EmailRepository _emailRepository;
  ContactCubit(this._emailRepository) : super(const ContactInitial());

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
      final responseBody = await _emailRepository.sendContactEmail(
          userName: state.contact.name,
          emailSubject: state.contact.subject,
          userEmail: state.contact.userEmail,
          emailContent: state.contact.content);
      if (responseBody == 'OK') {
        emit(const ContactInitial());
        emit(state.copyWith(status: TextFieldStatus.comeback));
      } else {
        Utils.printDebugError(errorMessage: 'Not sended');
      }
    }
  }
}
