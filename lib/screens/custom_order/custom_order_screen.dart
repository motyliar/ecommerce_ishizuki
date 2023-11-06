import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/drop_down_menu_list.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'widget/exports.dart';

/*   TO DO
For better quaility of sending orders need to create validation in form. 
Protect of sendind empty messagess
Need to also ensure that emailing is protect of sending by boot
 */

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
                            name: 'NAME',
                            controller: customNameController,
                            validation:
                                AppLocalizations.of(context)!.validationName,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleEmail,
                            name: 'EMAIL',
                            controller: customEmailController,
                            validation:
                                AppLocalizations.of(context)!.validationEmail,
                            regExpGeneral: kRegExpEmailValidation,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Kind of rock: ',
                                  style: labelTextMidBlack),
                              DropdownButton(
                                  items: productKind,
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
                                  name: 'LONG',
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  controller: customLongController,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: CustomTextFormField(
                                  title: AppLocalizations.of(context)!.width,
                                  name: 'WIDTH',
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  controller: customWidthController,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                              SizedBox(
                                width: 60,
                                child: CustomTextFormField(
                                  title: AppLocalizations.of(context)!.height,
                                  name: 'HEIGHT',
                                  setPadding: 0,
                                  keybordType: TextInputType.number,
                                  controller: customHeightController,
                                  validation: AppLocalizations.of(context)!
                                      .validationWrong,
                                  regExpGeneral: kRegExpNumberValidation,
                                ),
                              ),
                            ],
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!.description,
                            name: 'DESCRIPTION',
                            minLines: 1,
                            maxLines: 10,
                            controller: customDescriptionController,
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
                                      child: const Text(
                                        'UPLOAD',
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
