import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String name;
  final int minLines;
  final int maxLines;
  final double setPadding;
  final TextInputType keybordType;
  final TextEditingController controller;
  final String validation;
  final String regExpGeneral;
  const CustomTextFormField({
    required this.title,
    required this.name,
    this.minLines = 1,
    this.maxLines = 1,
    this.setPadding = 40,
    this.keybordType = TextInputType.emailAddress,
    required this.controller,
    required this.validation,
    this.regExpGeneral = r'^[a-zA-Z0-9]',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextFormField(
            validator: (value) {
              if (value == '') {
                return 'Can\'t be empty';
              } else if (!RegExp(regExpGeneral).hasMatch(value!)) {
                return validation;
              } else {
                return null;
              }
            },
            minLines: minLines,
            maxLines: maxLines,
            style: labelText.copyWith(fontSize: 14, color: backgroundColor),
            decoration: InputDecoration(
              hintText: title,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor)),
            ),
            controller: controller,
            keyboardType: keybordType,
            onTap: () {
              BlocProvider.of<CustomBloc>(context)
                  .add(ChangeCustomStatusEvent(value: name));
            },
            onChanged: (value) {
              BlocProvider.of<CustomBloc>(context)
                  .add(ChangeCustomValueEvent(value: value));
            },
          ),
        );
      },
    );
  }
}
