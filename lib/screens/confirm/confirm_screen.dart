import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/enums/enums.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

import 'package:ecommerce_ishizuki/screens/confirm/widgets.dart';
import 'package:ecommerce_ishizuki/screens/error/error_screen.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

final TextEditingController _nameController = TextEditingController();
final TextEditingController _surnameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _streetController = TextEditingController();
final TextEditingController _numbersController = TextEditingController();
final TextEditingController _zipCodeController = TextEditingController();
final TextEditingController _specialWishesController = TextEditingController();

class ConfirmScreen extends StatelessWidget {
  const ConfirmScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kConfirmScreen),
        builder: (_) => const ConfirmScreen());
  }

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    return Scaffold(
        appBar: const CustomAppBar(
          popArrow: false,
          imgName: kAppBarConfirmLogo,
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
                    return Form(
                      key: keyForm,
                      child: Column(
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
                                              Image.network(
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
                                  '${AppLocalizations.of(context)!.labelTotal} ${state.cart.getTotalPricing} ${context.select((CurrencyBloc bloc) => bloc.state.currentSign)}',
                                  style: labelTextMidBlack,
                                )),
                          ),
                          LabelTexts(
                            title: AppLocalizations.of(context)!.labelNames,
                          ),
                          CustomTextFormField(
                            title:
                                AppLocalizations.of(context)!.textFormTitleName,
                            controller: _nameController,
                            name: TextFieldEnum.name,
                            validation:
                                AppLocalizations.of(context)!.validationName,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleSurname,
                            controller: _surnameController,
                            name: TextFieldEnum.surname,
                            validation:
                                AppLocalizations.of(context)!.validationSurname,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleEmail,
                            controller: _emailController,
                            name: TextFieldEnum.email,
                            validation:
                                AppLocalizations.of(context)!.validationEmail,
                            regExpGeneral: kRegExpEmailValidation,
                          ),
                          LabelTexts(
                              title:
                                  AppLocalizations.of(context)!.labelAddress),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleStreet,
                            controller: _streetController,
                            name: TextFieldEnum.street,
                            validation:
                                AppLocalizations.of(context)!.validationStreet,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleHomeNumber,
                            controller: _numbersController,
                            name: TextFieldEnum.number,
                            validation:
                                AppLocalizations.of(context)!.validationWrong,
                          ),
                          CustomTextFormField(
                            title:
                                AppLocalizations.of(context)!.textFormTitleCity,
                            controller: _cityController,
                            name: TextFieldEnum.city,
                            validation:
                                AppLocalizations.of(context)!.validationCity,
                          ),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!
                                .textFormTitleZipCode,
                            controller: _zipCodeController,
                            name: TextFieldEnum.zipcode,
                            validation:
                                AppLocalizations.of(context)!.validationZipCode,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40.0, bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    '${AppLocalizations.of(context)!.labelCountry} '),
                                DropdownButton(
                                    items: Utils().generateDropDownMenuItemList(
                                        kCountryDeliveryDestination),
                                    value: state.address.country,
                                    onChanged: (value) {
                                      BlocProvider.of<ConfirmBloc>(context).add(
                                          CountryValueEvent(value: value!));
                                    }),
                              ],
                            ),
                          ),
                          LabelTexts(
                              title: AppLocalizations.of(context)!.labelWishes),
                          CustomTextFormField(
                            title: AppLocalizations.of(context)!.labelWishes,
                            controller: _specialWishesController,
                            name: TextFieldEnum.wishes,
                            validation: '',
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const ErrorScreen();
                  }
                },
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        _nameController.clear();
                        _surnameController.clear();
                        _cityController.clear();
                        _numbersController.clear();
                        _zipCodeController.clear();
                        _streetController.clear();
                        _specialWishesController.clear();
                        _emailController.clear();
                        context.read<ConfirmBloc>().add(ClearAddressEvent());
                      },
                      child: const Text(
                        'Clear',
                        style: labelTextMidBlack,
                      )),
                  ConfirmDialog(
                    formKey: keyForm,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
