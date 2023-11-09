import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextFieldEnum name;
  final int minLines;
  final int maxLines;
  final double setPadding;
  final TextInputType keybordType;
  final TextEditingController controller;
  final String validation;
  final String regExpGeneral;
  final double textFormPadding;
  const CustomTextFormField({
    required this.title,
    required this.name,
    this.minLines = kTextFormDefaultSetLines,
    this.maxLines = kTextFormDefaultSetLines,
    this.setPadding = kTextFormNumberPadding,
    this.keybordType = TextInputType.emailAddress,
    required this.controller,
    required this.validation,
    this.regExpGeneral = kRegExpGeneralValidation,
    this.textFormPadding = kDefaultSpaceBetweenWidgets,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(bottom: textFormPadding),
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
            minLines: minLines,
            maxLines: maxLines,
            style: descriptionText,
            decoration: InputDecoration(
              hintText: title,
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: backgroundColor)),
            ),
            controller: controller,
            keyboardType: keybordType,
            onTap: () {
              BlocProvider.of<CustomBloc>(context)
                  .add(ChangeCustomStatusEvent(enumStatus: name));
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
