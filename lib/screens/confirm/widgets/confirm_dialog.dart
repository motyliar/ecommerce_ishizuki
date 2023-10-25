import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'details_text.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmBloc, ConfirmState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            context.read<ConfirmBloc>().add(OrderConfirmSymbol());
            showGeneralDialog(
                context: context,
                pageBuilder: (_, __, ___) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.transparent,
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          color: backgroundColor.withOpacity(0.5),
                          child: Material(
                            color: backgroundColor.withOpacity(0.5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Confirm your details:\n',
                                        style: labelText,
                                      ),
                                      DetailsText(
                                          title: 'Name:',
                                          text:
                                              '${state.address.name} ${state.address.surname}'),
                                      const SizedBox(height: 5),
                                      DetailsText(
                                          title: 'E-mail:',
                                          text: state.address.email),
                                      const SizedBox(height: 5),
                                      const DetailsText(
                                          title: 'Address:', text: ' '),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          '${state.address.street} ${state.address.numbers} \n${state.address.city} ${state.address.zipCode}\n${state.address.country}',
                                          style: labelMidText,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      DetailsText(
                                          title: 'Wishes:',
                                          text: '${state.address.wishes}'),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'BACK',
                                          style: labelText,
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          context
                                              .read<ConfirmBloc>()
                                              .add(SendConfirmEmail());
                                          Navigator.pushNamed(
                                              context, '/order');
                                        },
                                        child: const Text(
                                          'SEND',
                                          style: labelText,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            color: backgroundColor,
            child: Text(
              'REASUME',
              style: labelText.copyWith(fontSize: 25),
            ),
          ),
        );
      },
    );
  }
}
