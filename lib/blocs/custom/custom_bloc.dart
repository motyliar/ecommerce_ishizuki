import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'custom_event.dart';
part 'custom_state.dart';

class CustomBloc extends Bloc<CustomEvent, CustomState> {
  CustomBloc() : super(CustomInitial()) {
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
            base64image: state.base64image,
            status: CustomStatus.name));
      case 'EMAIL':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.email));
      case 'LONG':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.long));
      case 'WIDTH':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.width));
      case 'HEIGHT':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.height));
      case 'DESCRIPTION':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.description));
      case '':
        return emit(state.copyWith(
            customData: state.customData,
            file: state.file,
            base64image: state.base64image,
            status: CustomStatus.initial));
    }
  }

  _onChangeValue(ChangeCustomValueEvent event, Emitter<CustomState> emit) {
    switch (state.status.index) {
      case 0:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(name: event.value)));
      case 1:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(email: event.value)));
      case 2:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(long: event.value)));
      case 3:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(width: event.value)));
      case 4:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(height: event.value)));
      case 5:
        return emit(state.copyWith(
            status: state.status,
            file: state.file,
            base64image: state.base64image,
            customData: state.customData.copyWith(description: event.value)));
    }
  }

  _onGetKind(GetKindOfRockEvent event, Emitter<CustomState> emit) {
    emit(state.copyWith(
        status: state.status,
        file: state.file,
        base64image: state.base64image,
        customData: state.customData.copyWith(productKind: event.value)));
  }
  // LOADING PICTRUE FROM MOBILE
  // For now state base64image is List<int>
  // in Future need to transform in base64 variable
  // Base64 is comment at the moment

  _onLoadPictrue(LoadPictrueEvent event, Emitter<CustomState> emit) async {
    XFile? image;

    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    List<int> imageBytes = await image!.readAsBytes();
    // String base64 = base64Encode(imageBytes);

    emit(state.copyWith(
        customData: state.customData,
        status: state.status,
        file: File(image.path),
        base64image: imageBytes));

    // print('encode base64: $base64');

    print(image.toString());
    print(state.file);
  }

  // TO DO
  // Need to find best way to send image from custom order
  // First option will sending List of Bytes to server for Fetch in Admin Panel
  // Second option will buy subscription on EmailJS
  // Third option, allow to send every information from TextField in Gmail on Mobile

  //

  _onSendEmail(SendCustomEmailEvent event, Emitter<CustomState> emit) async {
    const serviceId = 'service_loy3rqq';
    const templateId = 'template_o2jg9yo';
    const userId = 'cdT7F_odFHGuBXuh3';
    final String content =
        'name: ${state.customData.name}\n email:${state.customData.email}\nlong:${state.customData.long}\nwidth:${state.customData.width}\nheight:${state.customData.height}\ndescription:${state.customData.description}\nkind:${state.customData.productKind}\nbase64:${state.base64image}';
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
            'user_subject': 'Custom Order from ${state.customData.name}',
            'user_userEmail': state.customData.email,
            'user_content': content,
          }
        }));
    print(response.body);
  }

  _onPrint(PrintValues event, Emitter<CustomState> emit) {
    print(
        'name: ${state.customData.name}\n email:${state.customData.email}\nlong:${state.customData.long}\nwidth:${state.customData.width}\nheight:${state.customData.height}\ndescription:${state.customData.description}\nkind:${state.customData.productKind}\nbase64:${state.base64image}');
  }
}
