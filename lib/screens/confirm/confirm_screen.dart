import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/country_drop_down_list.dart';
import 'package:ecommerce_ishizuki/data/list_data/text_controllers.dart';
import 'package:ecommerce_ishizuki/screens/confirm/widgets.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  static const routeName = '/confirmScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const ConfirmScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          popArrow: false,
          imgName: 'images/yourorder_logo.png',
          isPop: true,
        ),

        // BODY

        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ConfirmBloc, ConfirmState>(
                builder: (context, state) {
                  if (state is ConfirmInitial) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ConfirmChanges) {
                    print(state);
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width - 10,
                            height:
                                (state.cart.products.length * 95).toDouble(),
                            child: ListView.builder(
                              itemCount: state.cart.products.length,
                              itemBuilder: (context, index) {
                                return Builder(builder: (context) {
                                  final price =
                                      '${context.select((CurrencyBloc bloc) => bloc.state.currentConversion * state.cart.products[index].price)} ${context.select((CurrencyBloc bloc) => bloc.state.currentSign)}';
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20.0, left: 0.0, top: 5.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              '${index + 1}.',
                                              style: labelTextMidBlack,
                                            ),
                                            Image.asset(
                                              state.cart.products[index]
                                                  .imgUrl[0],
                                              width: 60,
                                              height: 60,
                                            ),
                                            Text(
                                              state.cart.products[index].name,
                                              style: headText,
                                            ),
                                            Text(
                                              price.toString(),
                                              style: labelTextMidBlack,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              },
                            )),
                        const Divider(
                          endIndent: 20,
                          indent: 20,
                          thickness: 1.5,
                          color: backgroundColor,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Total:   ${state.cart.getTotalPricing} ${context.select((CurrencyBloc bloc) => bloc.state.currentSign)}',
                                style: labelTextMidBlack,
                              )),
                        ),
                        const LabelTexts(
                          title: 'NAMES',
                        ),
                        CustomTextField(
                          title: 'name',
                          controller: nameController,
                          name: 'NAME',
                        ),
                        CustomTextField(
                          title: 'Surname',
                          controller: surnameController,
                          name: 'SURNAME',
                        ),
                        CustomTextField(
                            title: 'E-mail',
                            controller: emailController,
                            name: 'EMAIL'),
                        const LabelTexts(title: 'Address'),
                        CustomTextField(
                          title: 'street',
                          controller: streetController,
                          name: 'STREET',
                        ),
                        CustomTextField(
                          title: 'home number',
                          controller: numbersController,
                          name: 'NUMBER',
                        ),
                        CustomTextField(
                          title: 'city',
                          controller: cityController,
                          name: 'CITY',
                        ),
                        CustomTextField(
                          title: 'zip-code',
                          controller: zipCodeController,
                          name: 'ZIPCODE',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40.0, bottom: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Country: '),
                              DropdownButton(
                                  items: countryItems,
                                  value: state.address.country,
                                  onChanged: (value) {
                                    BlocProvider.of<ConfirmBloc>(context)
                                        .add(CountryValueEvent(value: value!));

                                    print(state.address.country);
                                  }),
                            ],
                          ),
                        ),
                        const LabelTexts(title: 'Special Wishes'),
                        CustomTextField(
                          title: 'special wishes',
                          controller: specialWishesController,
                          name: 'WISHES',
                        ),
                      ],
                    );
                  } else {
                    return const Text('Something Goes Wrong');
                  }
                },
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        nameController.clear();
                        surnameController.clear();
                        cityController.clear();
                        numbersController.clear();
                        zipCodeController.clear();
                        streetController.clear();
                        specialWishesController.clear();
                        emailController.clear();
                        context.read<ConfirmBloc>().add(ClearAddressEvent());
                      },
                      child: const Text(
                        'Clear',
                        style: labelTextMidBlack,
                      )),
                  ConfirmDialog(),
                ],
              )
            ],
          ),
        ));
  }
}
