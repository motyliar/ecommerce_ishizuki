import 'dart:async';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kContactScreen),
        builder: (_) => const ContactScreen());
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: const CustomAppBar(
          popArrow: false,
          imgName: kAppBarMainLogo,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: SingleChildScrollView(
          child: BlocConsumer<ContactCubit, ContactState>(
            listener: (context, state) {
              if (state.status == TextFieldStatus.comeback) {
                Timer.periodic(const Duration(seconds: 2), (timer) {
                  Navigator.pushNamed(context, kHomeScreen);
                  timer.cancel();
                });
              }
            },
            builder: (context, state) {
              return BlocBuilder<ContactCubit, ContactState>(
                builder: (context, state) {
                  return Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.contact.toUpperCase(),
                        style: headText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 30.0, left: 30.0, top: 40.0, bottom: 20.0),
                      child: Text(
                        AppLocalizations.of(context)!.contactDescription,
                        style: labelTextMidBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                name: 'NAME',
                                validation: AppLocalizations.of(context)!
                                    .validationName,
                                title: AppLocalizations.of(context)!
                                    .textFormTitleName,
                                controller: contactNameController,
                              ),
                              CustomTextFormField(
                                  name: 'EMAIL',
                                  regExpGeneral: kRegExpEmailValidation,
                                  validation: AppLocalizations.of(context)!
                                      .validationEmail,
                                  title: AppLocalizations.of(context)!
                                      .textFormTitleEmail,
                                  controller: contactEmailController),
                              CustomTextFormField(
                                  name: 'SUBJECT',
                                  validation: AppLocalizations.of(context)!
                                      .validationSubject,
                                  title: AppLocalizations.of(context)!
                                      .textFormTitleSubject,
                                  controller: contactSubjectController),
                              CustomTextFormField(
                                name: 'CONTENT',
                                validation: AppLocalizations.of(context)!
                                    .validationQuestion,
                                title: AppLocalizations.of(context)!
                                    .textFormTitleQuestion,
                                controller: contactQuestionController,
                                minLines: 5,
                                maxLines: 15,
                              )
                            ],
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<ContactCubit>().sendEmail();
                          Utils.snackBarMessage(
                            context,
                            AppLocalizations.of(context)!.emailSend,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.black,
                          child: Text(
                            AppLocalizations.of(context)!.send,
                            style: labelText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                  ]);
                },
              );
            },
          ),
        ));
  }
}
