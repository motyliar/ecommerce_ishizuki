import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String name;
  final TextEditingController controller;
  const CustomTextField({
    required this.title,
    this.name = '',
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmBloc, ConfirmState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
            right: 40.0,
            bottom: 5.0,
          ),
          child: TextField(
            style: labelText.copyWith(fontSize: 12, color: backgroundColor),
            decoration: InputDecoration(
              hintText: title,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor)),
            ),
            controller: controller,
            onTap: () {
              context
                  .read<ConfirmBloc>()
                  .add(TextFieldStatusEvent(fieldName: name));
              print(state.status);
            },
            onChanged: (value) {
              BlocProvider.of<ConfirmBloc>(context)
                  .add(TextFieldValuesEvent(value: value));
            },
          ),
        );
      },
    );
  }
}