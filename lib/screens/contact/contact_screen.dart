import 'dart:async';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

// Main constans of contact screen
const double kContactClearSpace = 30.0;
// validation form sides padding
const double kContactFormSidesPadding = 40.0;
// padding of contact label CONTACT
const double kContactTopLabelPaddingSides = 30.0;
const double kContactTopLabelPaddingTop = 40.0;
const double kContactTopLabelPaddingBottom = 20.0;

TextEditingController _contactNameController = TextEditingController();
TextEditingController _contactEmailController = TextEditingController();
TextEditingController _contactQuestionController = TextEditingController();
TextEditingController _contactSubjectController = TextEditingController();

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
                      height: kContactClearSpace,
                    ),
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.contact.toUpperCase(),
                        style: headText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: kContactTopLabelPaddingSides,
                          left: kContactTopLabelPaddingSides,
                          top: kContactTopLabelPaddingTop,
                          bottom: kContactTopLabelPaddingBottom),
                      child: Text(
                        AppLocalizations.of(context)!.contactDescription,
                        style: labelTextMidBlack,
                      ),
                    ),
                    const SizedBox(
                      height: kContactClearSpace,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: kContactFormSidesPadding,
                          right: kContactFormSidesPadding),
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                name: TextFieldEnum.name,
                                validation: AppLocalizations.of(context)!
                                    .validationName,
                                title: AppLocalizations.of(context)!
                                    .textFormTitleName,
                                controller: _contactNameController,
                              ),
                              CustomTextFormField(
                                  name: TextFieldEnum.email,
                                  regExpGeneral: kRegExpEmailValidation,
                                  validation: AppLocalizations.of(context)!
                                      .validationEmail,
                                  title: AppLocalizations.of(context)!
                                      .textFormTitleEmail,
                                  controller: _contactEmailController),
                              CustomTextFormField(
                                  name: TextFieldEnum.subject,
                                  validation: AppLocalizations.of(context)!
                                      .validationSubject,
                                  title: AppLocalizations.of(context)!
                                      .textFormTitleSubject,
                                  controller: _contactSubjectController),
                              CustomTextFormField(
                                name: TextFieldEnum.description,
                                validation: AppLocalizations.of(context)!
                                    .validationQuestion,
                                title: AppLocalizations.of(context)!
                                    .textFormTitleQuestion,
                                controller: _contactQuestionController,
                                minLines: kContactFormMinLines,
                                maxLines: kContactFormMaxLInes,
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
                          _contactEmailController.clear();
                          _contactNameController.clear();
                          _contactQuestionController.clear();
                          _contactSubjectController.clear();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          color: Colors.black,
                          child: Text(
                            AppLocalizations.of(context)!.send,
                            style: labelText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kContactClearSpace,
                    ),
                  ]);
                },
              );
            },
          ),
        ));
  }
}
