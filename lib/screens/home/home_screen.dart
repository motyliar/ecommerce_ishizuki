import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/app_helpers.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APP BAR
      appBar: CustomAppBar(
        popArrow: false,
        imgName: 'http://motyliar.webd.pro/.sharedphotos/appbar_logo.png',
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: const CustomBottomAppBar(),

      // BODY
      //
      body: SingleChildScrollView(
          child: BlocBuilder<FetchProductsBloc, FetchProductsState>(
        builder: (context, state) {
          if (state is FetchProductsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchProductLoaded) {
            List<Product> listOfNewProducts =
                state.product.where((element) => element.isNew).toList();
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                      height: 270,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          color: mainTextColor.withOpacity(0.1)),
                      width: MediaQuery.of(context).size.width - 20,
                      child: const CategorySlider()),
                  const SizedBox(
                    height: 15,
                  ),
                  const Divider(
                    thickness: 1,
                    color: backgroundColor,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MiddleSquare(
                        text: 'ABOUT US',
                        route: '/about',
                      ),
                      MiddleSquare(
                        route: '/customOrderScreen',
                        text: 'CUSTOM',
                      ),
                      MiddleSquare(
                        route: '/delivery',
                        text: 'DELIVERY',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    color: backgroundColor,
                    child: Center(
                      child: Text(
                        'NEW STUFF',
                        style: headText.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(
                    thickness: 1,
                    color: backgroundColor,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: mainTextColor.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20.0))),
                    padding: const EdgeInsets.only(left: 70, right: 50),
                    width: MediaQuery.of(context).size.width - 20,
                    child: SizedBox(
                        height: 238 * listOfNewProducts.length.toDouble(),
                        width: 270,
                        child: ListView.builder(
                            itemCount: listOfNewProducts.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ProductListWidget(
                                  product: listOfNewProducts[index],
                                ))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Text(
                            'ARE YOU HAVE ANY QUESTION?',
                            style: labelTextMidBlack,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/contactScreen');
                              },
                              icon: const Icon(Icons.email)),
                        ],
                      )),
                ],
              ),
            );
          } else {
            return Text('Something Went Wrong');
          }
        },
      )),
    );
  }
}

class MiddleSquare extends StatelessWidget {
  final String route;
  final String text;
  const MiddleSquare({
    required this.route,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        children: [
          Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(3, -3)),
                  ],
                  gradient: LinearGradient(colors: [
                    mainTextColor.withOpacity(0.5),
                    backgroundColor,
                    mainTextColor.withOpacity(0.5)
                  ], begin: Alignment.topCenter),
                  color: mainTextColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Text(
                  text,
                  style: labelTextMidBlack,
                  maxLines: 2,
                ),
              )),
        ],
      ),
    );
  }
}
