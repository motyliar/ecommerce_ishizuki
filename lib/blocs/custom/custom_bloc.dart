import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';

import 'package:ecommerce_ishizuki/repository/serverAPI/custom_repository.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'custom_event.dart';
part 'custom_state.dart';

class CustomBloc extends Bloc<CustomEvent, CustomState> {
  CustomRepository _customRepository;
  CustomBloc(this._customRepository) : super(const CustomInitial()) {
    on<ChangeCustomStatusEvent>(_onChangeStatus);
    on<ChangeCustomValueEvent>(_onChangeValue);
    on<GetKindOfRockEvent>(_onGetKind);
    on<LoadPictrueEvent>(_onLoadPictrue);
    on<SendCustomEmailEvent>(_onSendEmail);
  }

  _onChangeStatus(ChangeCustomStatusEvent event, Emitter<CustomState> emit) {
    switch (event.enumStatus) {
      case TextFieldEnum.name:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.name));
      case TextFieldEnum.email:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.email));
      case TextFieldEnum.long:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.long));
      case TextFieldEnum.width:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.width));
      case TextFieldEnum.height:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.height));
      case TextFieldEnum.description:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.description));
      case TextFieldEnum.initial:
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: TextFieldStatus.initial));
      default:
    }
  }

  _onChangeValue(ChangeCustomValueEvent event, Emitter<CustomState> emit) {
    switch (state.status.index) {
      case 0:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(name: event.value)));
      case 1:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(email: event.value)));
      case 2:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(long: event.value)));
      case 3:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(width: event.value)));
      case 4:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(height: event.value)));
      case 5:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            customData: state.customData.copyWith(description: event.value)));
    }
  }

  _onGetKind(GetKindOfRockEvent event, Emitter<CustomState> emit) {
    emit(state.copyWith(
        status: state.status,
        file: state.file,
        customData: state.customData.copyWith(productKind: event.value)));
  }

/* 
Pictrue is loading to the state like base64 encoding.
It's the best way to safe transfer image data to server
*/
  _onLoadPictrue(LoadPictrueEvent event, Emitter<CustomState> emit) async {
    XFile? image;

    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    List<int> imageBytes = await image!.readAsBytes();
    String base64 = base64Encode(imageBytes);

    emit(state.copyWith(
      customData: state.customData.copyWith(base64: base64),
      status: state.status,
      file: File(image.path),
    ));

    // print('encode base64: $base64');
  }

  /* 
    It's not exactly sending email.
    Now, we send custom order to DB, becouse of email free account limit.
    Here we have method to sending information about order to email, then sending data to DB to fetch in admin panel.
    */

  _onSendEmail(SendCustomEmailEvent event, Emitter<CustomState> emit) async {
    // const serviceId = 'service_loy3rqq';
    // const templateId = 'template_o2jg9yo';
    // const userId = 'cdT7F_odFHGuBXuh3';

    // final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    // final response = await http.post(url,
    //     headers: {
    //       'origin': 'http://localhost',
    //       'Content-Type': 'application/json'
    //     },
    //     body: json.encode({
    //       'service_id': serviceId,
    //       'template_id': templateId,
    //       'user_id': userId,
    //       'template_params': {
    //         'user_name': state.customData.name,
    //         'user_subject': 'New order on DB',
    //         'user_userEmail': state.customData.email,
    //       }
    //     }));
    // if (response.body == 'OK') {}

    try {
      await _customRepository.postData(state.customData);
    } catch (err) {
      Utils.printDebugError(errorMessage: err.toString());
    }
  }
}
