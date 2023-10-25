import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/drop_down_menu_list.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';

class CustomOrderScreen extends StatelessWidget {
  const CustomOrderScreen({super.key});
  static const routeName = '/customOrderScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CustomOrderScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
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
                    'CUSTOM ORDER',
                    style: headText.copyWith(color: Colors.white),
                  )),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
                padding: const EdgeInsets.only(
                    top: 10, right: 30, left: 30, bottom: 10),
                decoration: shadeBox,
                child: const Text(
                  'If you can\'t find product for you. You can also order your custom rock if you wish. Take your time and prepare for us, the most details you can know to have. We will contact with you to confirm your order.',
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
                    return Column(
                      children: [
                        CustomTextField(
                          title: 'Your name',
                          name: 'NAME',
                          controller: customNameController,
                        ),
                        CustomTextField(
                          title: 'E-mail',
                          name: 'EMAIL',
                          controller: customEmailController,
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
                            const Text(
                              'Dimensions',
                              style: labelTextMidBlack,
                            ),
                            SizedBox(
                              width: 60,
                              child: CustomTextField(
                                title: 'Long',
                                name: 'LONG',
                                setPadding: 0,
                                keybordType: TextInputType.number,
                                controller: customLongController,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: CustomTextField(
                                title: 'Width',
                                name: 'WIDTH',
                                setPadding: 0,
                                keybordType: TextInputType.number,
                                controller: customWidthController,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: CustomTextField(
                                title: 'Height',
                                name: 'HEIGHT',
                                setPadding: 0,
                                keybordType: TextInputType.number,
                                controller: customHeightController,
                              ),
                            ),
                          ],
                        ),
                        CustomTextField(
                          title: 'Description',
                          name: 'DESCRIPTION',
                          minLines: 1,
                          maxLines: 10,
                          controller: customDescriptionController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Upload your pictrue: ',
                                style: labelTextMidBlack,
                              ),
                              // GaleryButon(),

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
                            ? Text('no file')
                            : Image.file(
                                state.file!,
                                width: 50,
                                height: 50,
                              ),
                      ],
                    );
                  },
                ),
              ),
              BlocBuilder<CustomBloc, CustomState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<CustomBloc>().add(SendCustomEmailEvent());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [boxShadowCustom],
                        color: Colors.black,
                      ),
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        'SEND',
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

class CustomTextField extends StatelessWidget {
  final String title;
  final String name;
  final int minLines;
  final int maxLines;
  final double setPadding;
  final TextInputType keybordType;
  final TextEditingController controller;
  const CustomTextField({
    required this.title,
    required this.name,
    this.minLines = 1,
    this.maxLines = 1,
    this.setPadding = 40,
    this.keybordType = TextInputType.emailAddress,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
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
            keyboardType: keybordType,
            onTap: () {
              BlocProvider.of<CustomBloc>(context)
                  .add(ChangeCustomStatusEvent(value: name));
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
