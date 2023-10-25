import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class CustomTextField extends StatelessWidget {
  final int minLines;
  final int maxLines;
  final String title;
  final String name;
  final TextEditingController controller;
  const CustomTextField({
    this.minLines = 1,
    this.maxLines = 1,
    required this.title,
    this.name = '',
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactCubit, ContactState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
            right: 40.0,
            bottom: 5.0,
          ),
          child: TextField(
            minLines: minLines,
            maxLines: maxLines,
            style: labelText.copyWith(fontSize: 14, color: backgroundColor),
            decoration: InputDecoration(
              hintText: title,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor)),
            ),
            controller: controller,
            onTap: () {
              BlocProvider.of<ContactCubit>(context).changeStatus(name);
              print(state.status);
            },
            onChanged: (value) {
              BlocProvider.of<ContactCubit>(context).textFieldStates(value);
            },
          ),
        );
      },
    );
  }
}
