import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextFieldEnum name;
  final TextEditingController controller;
  final String regExpGeneral;
  final String validation;
  const CustomTextFormField({
    required this.title,
    required this.validation,
    this.regExpGeneral = kRegExpGeneralValidation,
    required this.name,
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
          child: TextFormField(
            validator: (value) {
              if (value == '') {
                return AppLocalizations.of(context)!.validationEmpty;
              } else if (!RegExp(regExpGeneral).hasMatch(value!)) {
                return validation;
              } else {
                return null;
              }
            },
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
