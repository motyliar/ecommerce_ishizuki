import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/drop_down_menu_list.dart';

class BottomTotalPriceWidget extends StatelessWidget {
  const BottomTotalPriceWidget({
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
                                  items: dropDownItems,
                                  style: labelText,
                                  value: state.cart.value,
                                  onChanged: (value) {
                                    context
                                        .read<CartBloc>()
                                        .add(DeliveryValueEvent(value: value!));
                                    print(state.cart.value);
                                  }),
                        ]);
                  } else {
                    return const Text('Something Wrong');
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
                        return const Text('Something Wrong');
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
                                const snackBar = SnackBar(
                                  content: Text(
                                    'Need to agree delivery rules',
                                  ),
                                  duration: Duration(seconds: 1),
                                );
                                state.deliveryAgree
                                    ? Navigator.pushNamed(
                                        context, '/confirmScreen')
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);

                                print(state);
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
