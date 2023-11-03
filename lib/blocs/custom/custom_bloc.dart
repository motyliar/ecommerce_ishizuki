import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/repository/custom_repository.dart';
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
    on<PrintValues>(_onPrint);
  }

  _onChangeStatus(ChangeCustomStatusEvent event, Emitter<CustomState> emit) {
    switch (event.value) {
      case 'NAME':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.name));
      case 'EMAIL':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.email));
      case 'LONG':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.long));
      case 'WIDTH':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.width));
      case 'HEIGHT':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.height));
      case 'DESCRIPTION':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.description));
      case '':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            status: CustomStatus.initial));
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

    print(image.toString());
    print(state.file);
  }

  /* 
    It's not exactly sending email.
    Now, we send custom order to DB, becouse of email free account limit.
    Here we have method to sending information about order to email, then sending data to DB to fetch in admin panel.
    */

  _onSendEmail(SendCustomEmailEvent event, Emitter<CustomState> emit) async {
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
            'user_name': state.customData.name,
            'user_subject': 'New order on DB',
            'user_userEmail': state.customData.email,
          }
        }));
    if (response.body == 'OK') {
      customNameController.clear();
      customEmailController.clear();
      customLongController.clear();
      customHeightController.clear();
      customWidthController.clear();
      customDescriptionController.clear();
    }
    ;

    try {
      await _customRepository.postData(state.customData);
    } catch (err) {
      print(err);
    }
  }

  _onPrint(PrintValues event, Emitter<CustomState> emit) {
    print(
        'name: ${state.customData.name}\n email:${state.customData.email}\nlong:${state.customData.long}\nwidth:${state.customData.width}\nheight:${state.customData.height}\ndescription:${state.customData.description}\nkind:${state.customData.productKind}\nbase64:');
  }
}
