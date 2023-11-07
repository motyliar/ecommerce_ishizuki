import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CustomTextFormField extends StatelessWidget {
  final TextFieldEnum name;
  final String regExpGeneral;
  final String validation;
  final String title;
  final int minLines;
  final int maxLines;
  final TextEditingController controller;

  const CustomTextFormField({
    required this.name,
    required this.validation,
    this.regExpGeneral = kRegExpGeneralValidation,
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
              return AppLocalizations.of(context)!.validationEmpty;
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
          },
          onChanged: (value) {
            BlocProvider.of<ContactCubit>(context).textFieldStates(value);
          },
        );
      },
    );
  }
}
