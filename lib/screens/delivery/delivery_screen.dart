import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/data/list_data/drop_down_menu_list.dart';
import 'package:ecommerce_ishizuki/data/list_data/prices_list.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

import '../../config/config_exports.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  static const routeName = '/delivery';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const DeliveryScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          popArrow: false,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: Container(
          color: mainTextColor.withOpacity(0.08),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(
                  child: Container(
                color: backgroundColor,
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'DELIVERY',
                  style: headText.copyWith(color: Colors.white),
                ),
              )),
              Divider(
                endIndent: 20.0,
                indent: 20.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 1),
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                          color: Colors.grey.withOpacity(0.2)),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 30.0, left: 30.0),
                  child: Text(
                      'Delivering  around the world needed a lot of care. We are doing our best to shipping safety and fast.\nBelow you can check approximate prices and maximum sizes for one package\nEvery order we need to calculate separatly, becouse of sizes and weight is limited for one package',
                      style: descriptionText),
                ),
              ),
              Divider(
                endIndent: 20.0,
                indent: 20.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 6.0),
                            padding: const EdgeInsets.only(
                                top: 50, bottom: 50, left: 8, right: 8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                      color: Colors.grey.withOpacity(0.2)),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            width: 120,
                            child: BlocBuilder<DeliveryCubit, DeliveryState>(
                              builder: (context, state) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Max. weight:'),
                                    Text(
                                      state.weight ? '22 kg' : '48 lbs',
                                      style: labelTextMidBlack.copyWith(
                                          fontSize: 34),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context
                                              .read<DeliveryCubit>()
                                              .changeWeight();
                                        },
                                        icon: Icon(
                                          Icons.change_circle,
                                          color: Colors.black,
                                        ))
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(
                            top: 5, bottom: 5, left: 8, right: 8),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(1, 1),
                                  blurRadius: 8.0,
                                  spreadRadius: 2.0,
                                  color: Colors.grey.withOpacity(0.2)),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: BlocBuilder<DeliveryCubit, DeliveryState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                Text(
                                  'Maximum sizes:',
                                  style:
                                      labelTextMidBlack.copyWith(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 210,
                                  height: 170,
                                  child: Stack(children: [
                                    Positioned(
                                        top: 0,
                                        left: 50,
                                        child: Image.network(
                                          'https://tiny.pl/cpscw',
                                          width: 170,
                                          height: 170,
                                        )),
                                    Positioned(
                                      top: 70,
                                      left: 0,
                                      child: Text(
                                        state.weight ? '40 cm' : '15,5"',
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 35,
                                      child: Text(
                                        state.weight ? '40 cm' : '15,5"',
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 30,
                                      child: Text(
                                        state.weight ? '76 cm' : '30"',
                                        style: labelTextMidBlack,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 10,
                child: Column(children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, left: 80, right: 80),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 8.0,
                              spreadRadius: 2.0,
                              color: Colors.grey.withOpacity(0.2)),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'PRICES: ',
                      style: labelTextMidBlack.copyWith(fontSize: 20.0),
                    ),
                  ),
                  Divider(
                    endIndent: 20.0,
                    indent: 20.0,
                    thickness: 1.0,
                  ),
                  BlocBuilder<DeliveryCubit, DeliveryState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 30, right: 40),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                      color: Colors.grey.withOpacity(0.2)),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                RowPrices(
                                  text: state.weight ? '0-5kg' : '0-11lbs',
                                  prices:
                                      '${pricesList[state.pricesIndex][0]}\$',
                                ),
                                RowPrices(
                                  text: state.weight ? '5-10kg' : '11-22lbs',
                                  prices:
                                      '${pricesList[state.pricesIndex][1]}\$',
                                ),
                                RowPrices(
                                  text: state.weight ? '10-15kg' : '22-33lbs',
                                  prices:
                                      '${pricesList[state.pricesIndex][2]} \$',
                                ),
                                RowPrices(
                                    text: state.weight ? '15-25kg' : '33-55lbs',
                                    prices:
                                        '${pricesList[state.pricesIndex][3]} \$')
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 8, right: 8),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 1),
                                      blurRadius: 8.0,
                                      spreadRadius: 2.0,
                                      color: Colors.grey.withOpacity(0.2)),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: DropdownButton(
                              items: dropDownItems,
                              value: state.pricesValue,
                              onChanged: (value) {
                                context
                                    .read<DeliveryCubit>()
                                    .changeCountry(value!);
                              },
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ]),
              )
            ]),
          ),
        ));
  }
}
