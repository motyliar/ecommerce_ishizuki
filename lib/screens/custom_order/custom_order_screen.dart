import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'widget/exports.dart';

TextEditingController _customNameController = TextEditingController();
TextEditingController _customEmailController = TextEditingController();
TextEditingController _customLongController = TextEditingController();
TextEditingController _customWidthController = TextEditingController();
TextEditingController _customHeightController = TextEditingController();
TextEditingController _customDescriptionController = TextEditingController();

class CustomOrderScreen extends StatelessWidget {
  const CustomOrderScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kCustomScreen),
        builder: (_) => const CustomOrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: const CustomAppBar(
        imgName: kAppBarMainLogo,
        isPop: true,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: mainTextColor.withOpacity(0.08),
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black, boxShadow: [boxShadowCustom]),
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(7.0),
                  child: Text(
                    AppLocalizations.of(context)!.labelCustom.toUpperCase(),
                    style: headText.copyWith(color: Colors.white),
                  )),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                padding: const EdgeInsets.only(
                    top: 10, right: 30, left: 30, bottom: 10),
                decoration: shadeBox,
                child: Text(
                  AppLocalizations.of(context)!.customOrderDescription,
                  style: labelTextMidBlack,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 10.0, right: 25.0, left: 25.0),
                margin: const EdgeInsets.only(
                    right: 20.0, left: 20.0, top: 5.0, bottom: 5.0),
                decoration: shadeBox,
                child: BlocBuilder<CustomBloc, CustomState>(
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextFormField(
                            title:
                                AppLocalizations.of(context)!.textFormTitleName,
                            name: TextFieldEnum.name,
                            controller: _customNameController,
                            validation:
                                AppLocalizations.of(context)!.validationName,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleEmail,
                            name: TextFieldEnum.email,
                            controller: _customEmailController,
                            validation:
                                AppLocalizations.of(context)!.validationEmail,
                            regExpGeneral: kRegExpEmailValidation,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  AppLocalizations.of(context)!.labelKindOfRock,
                                  style: labelTextMidBlack),
                              DropdownButton(
                                  items: Utils().generateDropDownMenuItemList(
                                      kProductKindDropDownList),
                                  value: state.customData.productKind,
                                  onChanged: (value) {
                                    BlocProvider.of<CustomBloc>(context)
                                        .add(GetKindOfRockEvent(value: value!));
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.labelDimension,
                                style: labelTextMidBlack,
                              ),
                              SizedBox(
                                width: 60,
                                child: CustomTextFormField(
                                  title: AppLocalizations.of(context)!
                                      .textFormTitleLong,
                                  name: TextFieldEnum.long,
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  controller: _customLongController,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: CustomTextFormField(
                                  title: AppLocalizations.of(context)!.width,
                                  name: TextFieldEnum.width,
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  controller: _customWidthController,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: CustomTextFormField(
                                  title: AppLocalizations.of(context)!.height,
                                  name: TextFieldEnum.height,
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  controller: _customHeightController,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!.description,
                            name: TextFieldEnum.description,
                            minLines: 1,
                            maxLines: 10,
                            controller: _customDescriptionController,
                            validation: AppLocalizations.of(context)!
                                .validationDescription,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  '',
                                  style: labelTextMidBlack,
                                ),
                                InkWell(
                                  onTap: () {
                                    context
                                        .read<CustomBloc>()
                                        .add(LoadPictrueEvent());
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [boxShadowCustom],
                                        color: Colors.black,
                                      ),
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .customUploadButton
                                            .toUpperCase(),
                                        style: labelText,
                                      )),
                                )
                              ],
                            ),
                          ),
                          state.file == null
                              ? Text(AppLocalizations.of(context)!.noFile)
                              : Image.file(
                                  state.file!,
                                  width: 50,
                                  height: 50,
                                ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<CustomBloc, CustomState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<CustomBloc>().add(SendCustomEmailEvent());
                        Utils.snackBarMessage(
                            context, AppLocalizations.of(context)!.emailSend);
                        _customNameController.clear();
                        _customEmailController.clear();
                        _customLongController.clear();
                        _customHeightController.clear();
                        _customWidthController.clear();
                        _customDescriptionController.clear();
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowCustom],
                        color: Colors.black,
                      ),
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        AppLocalizations.of(context)!.send.toUpperCase(),
                        style: headText.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
