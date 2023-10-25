import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class DeliveryDialog extends StatelessWidget {
  const DeliveryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              return BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return GestureDetector(
                      onTap: () {
                        context.read<CartBloc>().add(DeliveryAgreeEvent());
                        Navigator.pop(context);
                      },
                      child: AlertDialog(
                        backgroundColor: backgroundColor,
                        title: Container(
                          width: 250,
                          height: 250,
                          color: backgroundColor,
                          child: Stack(children: [
                            const Positioned(
                                top: 5,
                                left: 20,
                                child: Text(
                                  'Delivery Rules',
                                  style: labelText,
                                )),
                            Positioned(
                                top: 50,
                                child: Container(
                                  width: 250,
                                  child: Text(
                                    '  We ship our product around the world. Delivery time may vary for different destinations.\n  Choose your place to know approximate price. After you confirm order we will send you email with total shipping price for those pieces.\n  We will send you message how fast how it will be possible include payment method to confirm order',
                                    style: labelText.copyWith(fontSize: 13),
                                  ),
                                )),
                          ]),
                        ),
                      ));
                },
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, bottom: 6.0),
        child: Row(
          children: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Text(
                    'Check our delivery rules',
                    style: state.deliveryAgree
                        ? labelTextMidBlack
                        : labelTextMidBlack.copyWith(color: Colors.red),
                  );
                } else {
                  return const Text('Something wrong');
                }
              },
            ),
            const SizedBox(
              width: 5,
            ),
            const Icon(Icons.local_shipping)
          ],
        ),
      ),
    );
  }
}
