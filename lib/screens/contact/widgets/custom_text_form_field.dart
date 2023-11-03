import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String name;
  final String regExpGeneral;
  final String validation;
  final String title;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;

  const CustomTextFormField({
    required this.name,
    required this.validation,
    this.regExpGeneral = r'^[a-zA-Z0-9]',
    required this.title,
    this.minLines = 1,
    this.maxLines = 1,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        return TextFormField(
          minLines: minLines,
          maxLines: maxLines,
          validator: (value) {
            if (value == '') {
              return 'Can\'t be empty';
            } else if (!RegExp(regExpGeneral).hasMatch(value!)) {
              return validation;
            } else {
              return null;
            }
          },
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: backgroundColor)),
          ),
          onTap: () {
            BlocProvider.of<ContactCubit>(context).changeStatus(name);
            print(state.status);
          },
          onChanged: (value) {
            BlocProvider.of<ContactCubit>(context).textFieldStates(value);
          },
        );
      },
    );
  }
}
