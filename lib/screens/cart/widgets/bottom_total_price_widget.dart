import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class BottomTotalPriceWidget extends StatelessWidget {
  final Function() snackBarMessage;
  List<DropdownMenuItem<String>> dropdownListGenerate;
  BottomTotalPriceWidget({
    required this.snackBarMessage,
    required this.dropdownListGenerate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: backgroundColor,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.isVisible
                                ? 'Delivery price: '
                                : 'Choose your place: ',
                            style: labelText,
                          ),
                          state.isVisible
                              ? Text(
                                  state.cart.getDeliveryPrice,
                                  style: labelText,
                                )
                              : DropdownButton(
                                  dropdownColor: backgroundColor,
                                  items: dropdownListGenerate,
                                  style: labelText,
                                  value: state.cart.value,
                                  onChanged: (value) {
                                    context
                                        .read<CartBloc>()
                                        .add(DeliveryValueEvent(value: value!));
                                    print('this is ${state.cart.value}');
                                  }),
                        ]);
                  } else {
                    return const ErrorScreen();
                  }
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Products Price: ',
                    style: labelText,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return Text(
                          state.cart.getCurrencyPricing,
                          style: labelText,
                        );
                      }
                      return const Text('0');
                    },
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
              endIndent: 20.0,
              indent: 20.0,
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total price: ',
                    style: labelText,
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoaded) {
                        return Text(
                          state.cart.getTotalPricing,
                          style: labelText,
                        );
                      } else {
                        return const ErrorScreen();
                      }
                    },
                  ),
                ],
              ),
            ),
            BlocConsumer<CartBloc, CartState>(listener: (context, state) {
              if (state is CartLoaded) {}
            }, builder: (context, state) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartError) {
                    return (const Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                  if (state is CartLoaded) {
                    BlocProvider.of<ConfirmBloc>(context)
                        .add(GetCartEvent(cart: state.cart));
                    return state.cart.products.isEmpty
                        ? Container()
                        : Container(
                            margin: const EdgeInsets.only(top: 6),
                            padding: const EdgeInsets.all(4),
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                state.deliveryAgree
                                    ? Navigator.pushNamed(
                                        context, kConfirmScreen)
                                    : snackBarMessage();
                              },
                              child: const Text(
                                'CONFIRM',
                                style: headText,
                              ),
                            ),
                          );
                  } else {
                    return const Text('data');
                  }
                },
              );
            }),
          ],
        ));
  }
}
