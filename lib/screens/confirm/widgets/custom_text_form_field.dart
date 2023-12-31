import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextFieldEnum name;
  final TextEditingController controller;
  final String regExpGeneral;
  final String validation;
  final double textFormPaddingSides;
  final double textFormPaddingBottom;
  const CustomTextFormField({
    required this.title,
    required this.validation,
    this.regExpGeneral = kRegExpGeneralValidation,
    required this.name,
    required this.controller,
    this.textFormPaddingSides = kTextFormPaddingSides,
    this.textFormPaddingBottom = kTextFormPaddingBottom,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmBloc, ConfirmState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            left: textFormPaddingSides,
            right: textFormPaddingSides,
            bottom: textFormPaddingBottom,
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
            style: hintText,
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
