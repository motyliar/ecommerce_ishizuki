import 'dart:async';

import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static const routeName = '/contactScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ContactScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          popArrow: false,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: SingleChildScrollView(
          child: BlocConsumer<ContactCubit, ContactState>(
            listener: (context, state) {
              if (state.status == TextFieldStatus.comeback) {
                final snackBar = SnackBar(
                  content: Text('Message sent'),
                  duration: Duration(seconds: 1),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Timer.periodic(const Duration(seconds: 2), (timer) {
                  Navigator.pushNamed(context, '/');
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
                    const Center(
                      child: Text(
                        'CONTACT',
                        style: headText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 30.0, left: 30.0, top: 40.0, bottom: 20.0),
                      child: Text(
                        'If you have any questions about our products feel free to send message to us. We will reply to you as fast as will possible. As well if you dosnt find any interesting product now.',
                        style: labelTextMidBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    CustomTextField(
                      title: 'NAME',
                      controller: contactNameController,
                      name: 'NAME',
                    ),
                    CustomTextField(
                      title: 'EMAIL',
                      controller: contactEmailController,
                      name: 'EMAIL',
                    ),
                    CustomTextField(
                      title: 'SUBJECT',
                      controller: contactSubjectController,
                      name: 'SUBJECT',
                    ),
                    CustomTextField(
                      title: 'QUESTION',
                      controller: contactQuestionController,
                      name: 'CONTENT',
                      minLines: 5,
                      maxLines: 15,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<ContactCubit>().sendEmail();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7.0),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.black,
                          child: const Text(
                            'SEND',
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
