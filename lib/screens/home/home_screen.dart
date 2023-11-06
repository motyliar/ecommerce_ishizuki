import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kHomeScreen),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APP BAR
      appBar: CustomAppBar(
        popArrow: false,
        imgName: kAppBarMainLogo,
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
            List<Product> listOfNewProducts = state.product
                .where((element) => element.isSold == false)
                .toList();
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MiddleSquare(
                        text:
                            AppLocalizations.of(context)!.aboutUs.toUpperCase(),
                        route: kAboutScreen,
                      ),
                      MiddleSquare(
                          route: kCustomScreen,
                          text: AppLocalizations.of(context)!
                              .custom
                              .toUpperCase()),
                      MiddleSquare(
                          route: kDeliveryScreen,
                          text: AppLocalizations.of(context)!
                              .delivery
                              .toUpperCase()),
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
                        AppLocalizations.of(context)!.check.toUpperCase(),
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
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20.0))),
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: SizedBox(
                        height: 210 * listOfNewProducts.length.toDouble(),
                        // width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            itemCount: listOfNewProducts.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ProductListHome(
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
